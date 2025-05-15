rm(list = ls()); gc(); source(".Rprofile")

# Load the combined NHANES data sample:
source((paste0(path_nhanes_body_composition,"/run all nsbdat.R")))
        
combined_nhanes <- readRDS("/Users/krishnasanaka/Library/CloudStorage/OneDrive-Emory/NHANES Subtypes Body Composition/working/cleaned/combined_nhanes.rds")

# Load the analytic sample
source(".Rprofile")
source("analysis/ncan_analytic sample for survival.R")

# Subset for required variables:
subset_combined_nhanes <- combined_nhanes %>%
  select(
    respondentid,
    total_fat,
    total_lean,
    left_arm_fat_percentage,
    right_arm_fat_percentage,
    left_leg_fat_percentage,
    right_leg_fat_percentage,
    trunk_fat_percentage,
    height,
    left_arm_lean_mass_with_body_mineral_content,
    right_arm_lean_mass_with_bone_mineral_content,
    left_leg_lean_mass_with_bone_mineral_content,
    right_leg_lean_mass_with_bone_mineral_content,
    trunk_lean_mass_with_bone_mineral_content
  )

# Join the two data sets:
joined_sample <- analytic_sample %>%
  inner_join(subset_combined_nhanes, by = "respondentid")

# Calculating new variables:
joined_sample <- joined_sample %>%
  mutate(
    percentage_arm_and_leg_fat = left_arm_fat_percentage +
      right_arm_fat_percentage +
      left_leg_fat_percentage +
      right_leg_fat_percentage,
    
    trunk_to_limb_fat_ratio = trunk_fat_percentage / percentage_arm_and_leg_fat,
    
    fat_mass_index = total_fat / (height^2),
    
    leg_to_trunk_lean_mass_ratio = (left_leg_lean_mass_with_bone_mineral_content +
                                      right_leg_lean_mass_with_bone_mineral_content) /
      trunk_lean_mass_with_bone_mineral_content,
    
    lean_mass_index = total_lean / (height^2)
  )

# Create survey design object for joined sample
joined_sample_svy <- svydesign(
  ids = ~psu,
  strata = ~pseudostratum,
  weights = ~pooled_weight,
  nest = TRUE,
  data = joined_sample
)

# Creating the function and table:
mean_sd_ci_survey <- function(variable_name, survey_design) {
  mean_est <- svymean(as.formula(paste("~", variable_name)), survey_design, na.rm = TRUE)
  sd_est <- sqrt(svyvar(as.formula(paste("~", variable_name)), survey_design, na.rm = TRUE))
  ci <- confint(mean_est)
  return(sprintf("%.3f (%.3f, %.3f) [%.3f]", coef(mean_est), ci[1], ci[2], sd_est))
}

# Overall summary from joined sample survey design
overall_summary <- data.frame(
  cluster = "Overall",
  Body_Mass_Index = mean_sd_ci_survey("bmi", joined_sample_svy),
  Body_Fat_Percentage = mean_sd_ci_survey("fat_percentage", joined_sample_svy),
  Waist_Circumference = mean_sd_ci_survey("waistcircumference", joined_sample_svy),
  Subcutaneous_Fat_Proxy = mean_sd_ci_survey("percentage_arm_and_leg_fat", joined_sample_svy),
  Central_Fat = mean_sd_ci_survey("trunk_fat_percentage", joined_sample_svy),
  Trunk_To_Limb_Fat_Ratio = mean_sd_ci_survey("trunk_to_limb_fat_ratio", joined_sample_svy),
  Fat_Mass_Index = mean_sd_ci_survey("fat_mass_index", joined_sample_svy),
  Leg_To_Trunk_Lean_Mass_Ratio = mean_sd_ci_survey("sbp", joined_sample_svy),
  Total_Lean_Mass = mean_sd_ci_survey("leg_to_trunk_lean_mass_ratio", joined_sample_svy),
  Lean_Mass_Index = mean_sd_ci_survey("lean_mass_index", joined_sample_svy)
)

# Create cluster-specific summary table using joined_sample survey design
clusters <- unique(joined_sample$cluster)
cluster_summary <- data.frame()

for (cluster_id in clusters) {
  cluster_design <- subset(joined_sample_svy, cluster == cluster_id)
  
  cluster_data <- data.frame(
    cluster = cluster_id,
    Body_Mass_Index = mean_sd_ci_survey("bmi", cluster_design),
    Body_Fat_Percentage = mean_sd_ci_survey("fat_percentage", cluster_design),
    Waist_Circumference = mean_sd_ci_survey("waistcircumference", cluster_design),
    Subcutaneous_Fat_Proxy = mean_sd_ci_survey("percentage_arm_and_leg_fat", cluster_design),
    Central_Fat = mean_sd_ci_survey("trunk_fat_percentage", cluster_design),
    Trunk_To_Limb_Fat_Ratio = mean_sd_ci_survey("trunk_to_limb_fat_ratio", cluster_design),
    Fat_Mass_Index = mean_sd_ci_survey("fat_mass_index", cluster_design),
    Leg_To_Trunk_Lean_Mass_Ratio = mean_sd_ci_survey("sbp", cluster_design),
    Total_Lean_Mass = mean_sd_ci_survey("leg_to_trunk_lean_mass_ratio", cluster_design),
    Lean_Mass_Index = mean_sd_ci_survey("lean_mass_index", cluster_design)
  )
  
  cluster_summary <- rbind(cluster_summary, cluster_data)
}

# Transpose and combine overall and cluster-specific summaries
overall_summary <- t(overall_summary)
overall_summary <- as.data.frame(overall_summary)
cluster_summary <- t(cluster_summary)
cluster_summary <- as.data.frame(cluster_summary)

# Combine into a single table
combined_summary <- cbind(overall_summary, cluster_summary)

# Save the resulting table
write.csv(combined_summary, file=paste0(path_nhanes_ckm_newdm, "/survey weighted body fat characteristics of overall sample and by cluster.csv"), row.names = TRUE)

