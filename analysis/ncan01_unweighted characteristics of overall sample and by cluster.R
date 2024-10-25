rm(list=ls());gc();source(".Rprofile")

# Reading in the clustered data frame:
analytic_sample <- read.csv(paste0(path_nhanes_ckm_newdm,"/knn clusters.csv"), header = TRUE, sep = ",")

# Creating formulas to generate estimates of the analytic sample:
mean_ci <- function(x) {
  n <- length(x[!is.na(x)])
  mean_x <- mean(x, na.rm = TRUE)
  sd_x <- sd(x, na.rm = TRUE)
  error <- 1.96 * (sd_x / sqrt(n))
  lower_ci <- mean_x - error
  upper_ci <- mean_x + error
  return(sprintf("%.1f (%.1f, %.1f)", mean_x, lower_ci, upper_ci))  # Format as "estimate (lower, upper)"
}

prop_ci_category <- function(x, category) {
  n <- length(x[!is.na(x)])
  p <- mean(x == category, na.rm = TRUE)  # Proportion of a specific category
  error <- 1.96 * sqrt((p * (1 - p)) / n)
  lower_ci <- p - error
  upper_ci <- p + error
  return(sprintf("%.1f%% (%.1f%%, %.1f%%)", p * 100, lower_ci * 100, upper_ci * 100))  # Format as percentage
}

# Creating the table:
# Function for overall and cluster-specific summaries
overall_summary <- analytic_sample %>%
  summarise(
    cluster = "Overall",
    `Male` = prop_ci_category(gender, 1),
    `Female` = prop_ci_category(gender, 2),
    `NH White` = prop_ci_category(race, 3),
    `NH Black` = prop_ci_category(race, 4),
    `Hispanic` = prop_ci_category(race, c(1, 2)),
    `Other Race` = prop_ci_category(race, 5),
    `Insured` = prop_ci_category(insured, 1),
    `Privately Insured` = prop_ci_category(insured_private, 1),
    `Insured by Medicare` = prop_ci_category(insured_medicare, 1),
    `Insured by Medicaid` = prop_ci_category(insured_medicaid, 1),
    `Household Income Under 20k` = prop_ci_category(hhincome, c(1, 2, 3, 4)),
    `Household Income 20k to 45k` = prop_ci_category(hhincome, c(5, 6, 7)),
    `Household Income 45k to 75k` = prop_ci_category(hhincome, c(8, 9, 10)),
    `Household Income 75k to 100k` = prop_ci_category(hhincome, 14),
    `Household Income Over 100k` = prop_ci_category(hhincome, 15),
    `Age` = mean_ci(age),
    `Age of DM Diagnosis` = mean_ci(dm_age),
    `Body Mass Index` = mean_ci(bmi),
    `Body Fat Percentage` = mean_ci(fat_percentage),
    `Waist Circumference` = mean_ci(waistcircumference),
    `Glycohemoglobin` = mean_ci(glycohemoglobin),
    `Fasting Glucose` = mean_ci(fasting_glucose),
    `LDL` = mean_ci(ldl),
    `HDL` = mean_ci(hdl),
    `SBP` = mean_ci(sbp),
    `DBP` = mean_ci(dbp),
    `Triglycerides` = mean_ci(triglyceride),
    `HOMA2-B` = mean_ci(homa2b),
    `HOMA2-IR` = mean_ci(homa2ir),
    `eGFR` = mean_ci(egfr),
    `ALT` = mean_ci(alt),
    `AST` = mean_ci(ast)
  )

# Invert rows and columns (transpose)
overall_summary <- t(overall_summary)

# Convert the result back to a data frame if needed
overall_summary <- as.data.frame(overall_summary)

# Calculate cluster-specific summaries
cluster_summary <- analytic_sample %>%
  dplyr::group_by(cluster) %>%
  summarise(
    `Male` = prop_ci_category(gender, 1),
    `Female` = prop_ci_category(gender, 2),
    `NH White` = prop_ci_category(race, 3),
    `NH Black` = prop_ci_category(race, 4),
    `Hispanic` = prop_ci_category(race, c(1, 2)),
    `Other Race` = prop_ci_category(race, 5),
    `Insured` = prop_ci_category(insured, 1),
    `Privately Insured` = prop_ci_category(insured_private, 1),
    `Insured by Medicare` = prop_ci_category(insured_medicare, 1),
    `Insured by Medicaid` = prop_ci_category(insured_medicaid, 1),
    `Household Income Under 20k` = prop_ci_category(hhincome, c(1, 2, 3, 4)),
    `Household Income 20k to 45k` = prop_ci_category(hhincome, c(5, 6, 7)),
    `Household Income 45k to 75k` = prop_ci_category(hhincome, c(8, 9, 10)),
    `Household Income 75k to 100k` = prop_ci_category(hhincome, 14),
    `Household Income Over 100k` = prop_ci_category(hhincome, 15),
    `Age` = mean_ci(age),
    `Age of DM Diagnosis` = mean_ci(dm_age),
    `Body Mass Index` = mean_ci(bmi),
    `Body Fat Percentage` = mean_ci(fat_percentage),
    `Waist Circumference` = mean_ci(waistcircumference),
    `Glycohemoglobin` = mean_ci(glycohemoglobin),
    `Fasting Glucose` = mean_ci(fasting_glucose),
    `LDL` = mean_ci(ldl),
    `HDL` = mean_ci(hdl),
    `SBP` = mean_ci(sbp),
    `DBP` = mean_ci(dbp),
    `Triglycerides` = mean_ci(triglyceride),
    `HOMA2-B` = mean_ci(homa2b),
    `HOMA2-IR` = mean_ci(homa2ir),
    `eGFR` = mean_ci(egfr),
    `ALT` = mean_ci(alt),
    `AST` = mean_ci(ast)
  )

# Invert rows and columns (transpose)
cluster_summary <- t(cluster_summary)

# Convert the result back to a data frame if needed
cluster_summary <- as.data.frame(cluster_summary)

# Combine overall and cluster-specific summaries
combined_summary <- cbind(overall_summary, cluster_summary)

# Save the resulting table:
write.csv(combined_summary, file=paste0(path_nhanes_ckm_newdm, "/unweighted characteristics of overall sample and by cluster.csv"), row.names = TRUE)
