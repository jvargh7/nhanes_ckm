# Clear environment and load configuration
rm(list=ls()); gc(); source(".Rprofile")

# Load the analytic sample
source("analysis/ncan_analytic sample for survival.R")

# Define survey design
analytic_sample_svy <- svydesign(id = ~psu, strata = ~pseudostratum, weights = ~pooled_weight, data = analytic_sample, nest = TRUE)

# Functions to calculate survey mean and proportion with confidence intervals
mean_sd_ci_survey <- function(variable_name, survey_design) {
  mean_est <- svymean(as.formula(paste("~", variable_name)), survey_design, na.rm = TRUE)
  sd_est <- sqrt(svyvar(as.formula(paste("~", variable_name)), survey_design, na.rm = TRUE))
  ci <- confint(mean_est)
  return(sprintf("%.1f (%.1f, %.1f) [%.1f]", coef(mean_est), ci[1], ci[2], sd_est))
}

prop_ci_category_survey <- function(variable_name, category, survey_design) {
  temp_design <- update(survey_design, temp_var = I(get(variable_name) %in% category))
  prop_est <- svyciprop(~temp_var, temp_design, method = "logit")
  ci <- confint(prop_est)
  return(sprintf("%.1f%% (%.1f%%, %.1f%%)", coef(prop_est) * 100, ci[1] * 100, ci[2] * 100))
}

weighted_n <- function(survey_design) {
  # Calculate weighted total by summing up the weights directly
  n_est <- sum(weights(survey_design))
  return(sprintf("%.0f", n_est))
}

# Create overall summary table
overall_summary <- data.frame(
  cluster = "Overall",
  N = weighted_n(analytic_sample_svy),
  Male = prop_ci_category_survey("gender", 1, analytic_sample_svy),
  Female = prop_ci_category_survey("gender", 2, analytic_sample_svy),
  NH_White = prop_ci_category_survey("race", 3, analytic_sample_svy),
  NH_Black = prop_ci_category_survey("race", 4, analytic_sample_svy),
  Hispanic = prop_ci_category_survey("race", c(1, 2), analytic_sample_svy),
  Other_Race = prop_ci_category_survey("race", 5, analytic_sample_svy),
  Smoking = prop_ci_category_survey("smoke_current", 1, analytic_sample_svy),
  Insured = prop_ci_category_survey("insured", 1, analytic_sample_svy),
  Uninsured = prop_ci_category_survey("insured", 2, analytic_sample_svy),
  Privately_Insured = prop_ci_category_survey("insured_private", 1, analytic_sample_svy),
  Insured_by_Medicare = prop_ci_category_survey("insured_medicare", 1, analytic_sample_svy),
  Insured_by_Medicaid = prop_ci_category_survey("insured_medicaid", 1, analytic_sample_svy),
  Household_Income_Under_20k = prop_ci_category_survey("hhincome", c(1, 2, 3, 4, 13), analytic_sample_svy),
  Household_Income_20k_to_45k = prop_ci_category_survey("hhincome", c(5, 6, 7), analytic_sample_svy),
  Household_Income_45k_to_75k = prop_ci_category_survey("hhincome", c(8, 9, 10), analytic_sample_svy),
  Household_Income_Over_75k = prop_ci_category_survey("hhincome", c(11, 14, 15), analytic_sample_svy),
  Household_Income_Other = prop_ci_category_survey("hhincome", c(12, 77, 99), analytic_sample_svy),
  Age = mean_sd_ci_survey("age", analytic_sample_svy),
  Age_of_DM_Diagnosis = mean_sd_ci_survey("dm_age", analytic_sample_svy),
  Body_Mass_Index = mean_sd_ci_survey("bmi", analytic_sample_svy),
  Body_Fat_Percentage = mean_sd_ci_survey("fat_percentage", analytic_sample_svy),
  Waist_Circumference = mean_sd_ci_survey("waistcircumference", analytic_sample_svy),
  Glycohemoglobin = mean_sd_ci_survey("glycohemoglobin", analytic_sample_svy),
  Fasting_Glucose = mean_sd_ci_survey("fasting_glucose", analytic_sample_svy),
  LDL = mean_sd_ci_survey("ldl", analytic_sample_svy),
  HDL = mean_sd_ci_survey("hdl", analytic_sample_svy),
  SBP = mean_sd_ci_survey("sbp", analytic_sample_svy),
  DBP = mean_sd_ci_survey("dbp", analytic_sample_svy),
  Triglycerides = mean_sd_ci_survey("triglyceride", analytic_sample_svy),
  HOMA2_B = mean_sd_ci_survey("homa2b", analytic_sample_svy),
  HOMA2_IR = mean_sd_ci_survey("homa2ir", analytic_sample_svy),
  eGFR = mean_sd_ci_survey("egfr", analytic_sample_svy),
  ALT = mean_sd_ci_survey("alt", analytic_sample_svy),
  AST = mean_sd_ci_survey("ast", analytic_sample_svy)
)

# Create cluster-specific summary table using weighted survey design
clusters <- unique(analytic_sample$cluster)
cluster_summary <- data.frame()

for (cluster_id in clusters) {
  # Subset the survey design by cluster
  cluster_design <- subset(analytic_sample_svy, cluster == cluster_id)
  
  # Calculate weighted estimates for the current cluster
  cluster_data <- data.frame(
    cluster = cluster_id,
    N = weighted_n(cluster_design),
    Male = prop_ci_category_survey("gender", 1, cluster_design),
    Female = prop_ci_category_survey("gender", 2, cluster_design),
    NH_White = prop_ci_category_survey("race", 3, cluster_design),
    NH_Black = prop_ci_category_survey("race", 4, cluster_design),
    Hispanic = prop_ci_category_survey("race", c(1, 2), cluster_design),
    Other_Race = prop_ci_category_survey("race", 5, cluster_design),
    Smoking = prop_ci_category_survey("smoke_current", 1, cluster_design),
    Insured = prop_ci_category_survey("insured", 1, cluster_design),
    Uninsured = prop_ci_category_survey("insured", 2, cluster_design),
    Privately_Insured = prop_ci_category_survey("insured_private", 1, cluster_design),
    Insured_by_Medicare = prop_ci_category_survey("insured_medicare", 1, cluster_design),
    Insured_by_Medicaid = prop_ci_category_survey("insured_medicaid", 1, cluster_design),
    Household_Income_Under_20k = prop_ci_category_survey("hhincome", c(1, 2, 3, 4, 13), cluster_design),
    Household_Income_20k_to_45k = prop_ci_category_survey("hhincome", c(5, 6, 7), cluster_design),
    Household_Income_45k_to_75k = prop_ci_category_survey("hhincome", c(8, 9, 10), cluster_design),
    Household_Income_Over_75k = prop_ci_category_survey("hhincome", c(11, 14, 15), cluster_design),
    Household_Income_Other = prop_ci_category_survey("hhincome", c(12, 77, 99), cluster_design),
    Age = mean_sd_ci_survey("age", cluster_design),
    Age_of_DM_Diagnosis = mean_sd_ci_survey("dm_age", cluster_design),
    Body_Mass_Index = mean_sd_ci_survey("bmi", cluster_design),
    Body_Fat_Percentage = mean_sd_ci_survey("fat_percentage", cluster_design),
    Waist_Circumference = mean_sd_ci_survey("waistcircumference", cluster_design),
    Glycohemoglobin = mean_sd_ci_survey("glycohemoglobin", cluster_design),
    Fasting_Glucose = mean_sd_ci_survey("fasting_glucose", cluster_design),
    LDL = mean_sd_ci_survey("ldl", cluster_design),
    HDL = mean_sd_ci_survey("hdl", cluster_design),
    SBP = mean_sd_ci_survey("sbp", cluster_design),
    DBP = mean_sd_ci_survey("dbp", cluster_design),
    Triglycerides = mean_sd_ci_survey("triglyceride", cluster_design),
    HOMA2_B = mean_sd_ci_survey("homa2b", cluster_design),
    HOMA2_IR = mean_sd_ci_survey("homa2ir", cluster_design),
    eGFR = mean_sd_ci_survey("egfr", cluster_design),
    ALT = mean_sd_ci_survey("alt", cluster_design),
    AST = mean_sd_ci_survey("ast", cluster_design)
  )
  
  # Append cluster data to the cluster summary table
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
write.csv(combined_summary, file=paste0("paper/survey weighted characteristics of overall sample and by cluster.csv"), row.names = TRUE)

