rm(list=ls());gc();source(".Rprofile")

# Loading in the relevant data sets:
combined_nhanes_over18 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/new diabetes/combined_nhanes_over18.rds"))

new_or_undiagnosed_dm <- readRDS(paste0(path_nhanes_ckm_folder,"/working/new diabetes/new_or_undiagnosed_dm.rds"))

nhanes_with_vars <- readRDS(paste0(path_nhanes_ckm_folder,"/working/new diabetes/nhanes_with_vars.rds"))

nhanes_without_vars <- readRDS(paste0(path_nhanes_ckm_folder,"/working/new diabetes/nhanes_without_vars.rds"))

analytic_sample <- read.csv(paste0(path_nhanes_ckm_newdm,"/knn clusters.csv"), header = TRUE, sep = ",")

# Separately calculate the variable parameters for the data frames:
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

# Creating the frames:
combined_nhanes_over18_summary <- combined_nhanes_over18 %>%
  summarise(
    cluster = "All NHANES ≥18 Years",
    `Male` = prop_ci_category(gender, 1),
    `Female` = prop_ci_category(gender, 2),
    `White` = prop_ci_category(race, 3),
    `Black` = prop_ci_category(race, 4),
    `Hispanic` = prop_ci_category(race, c(1, 2)),
    `Insured` = prop_ci_category(insured, 1),
    `Privately Insured` = prop_ci_category(insured_private, 1),
    `Insured by Medicare` = prop_ci_category(insured_medicare, 1),
    `Insured by Medicaid` = prop_ci_category(insured_medicaid, 1),
    `Household Income Under 20k` = prop_ci_category(hhincome, c(1, 2, 3, 4)),
    `Household Income 20k to 45k` = prop_ci_category(hhincome, c(5, 6, 7)),
    `Household Income 45k to 75k` = prop_ci_category(hhincome, c(8, 9, 10)),
    `Household Income 75k to 100k` = prop_ci_category(hhincome, 14),
    `Household Income Over 100k` = prop_ci_category(hhincome, 15),
    `Age` = mean_ci(age)
  )

new_or_undiagnosed_dm_summary <- new_or_undiagnosed_dm %>%
  summarise(
    cluster = "New or Undiagnosed DM",
    `Male` = prop_ci_category(gender, 1),
    `Female` = prop_ci_category(gender, 2),
    `White` = prop_ci_category(race, 3),
    `Black` = prop_ci_category(race, 4),
    `Hispanic` = prop_ci_category(race, c(1, 2)),
    `Insured` = prop_ci_category(insured, 1),
    `Privately Insured` = prop_ci_category(insured_private, 1),
    `Insured by Medicare` = prop_ci_category(insured_medicare, 1),
    `Insured by Medicaid` = prop_ci_category(insured_medicaid, 1),
    `Household Income Under 20k` = prop_ci_category(hhincome, c(1, 2, 3, 4)),
    `Household Income 20k to 45k` = prop_ci_category(hhincome, c(5, 6, 7)),
    `Household Income 45k to 75k` = prop_ci_category(hhincome, c(8, 9, 10)),
    `Household Income 75k to 100k` = prop_ci_category(hhincome, 14),
    `Household Income Over 100k` = prop_ci_category(hhincome, 15),
    `Age` = mean_ci(age)
  )

nhanes_with_vars_summary <- nhanes_with_vars %>%
  summarise(
    cluster = "With BMI and Glycohemoglobin",
    `Male` = prop_ci_category(gender, 1),
    `Female` = prop_ci_category(gender, 2),
    `White` = prop_ci_category(race, 3),
    `Black` = prop_ci_category(race, 4),
    `Hispanic` = prop_ci_category(race, c(1, 2)),
    `Insured` = prop_ci_category(insured, 1),
    `Privately Insured` = prop_ci_category(insured_private, 1),
    `Insured by Medicare` = prop_ci_category(insured_medicare, 1),
    `Insured by Medicaid` = prop_ci_category(insured_medicaid, 1),
    `Household Income Under 20k` = prop_ci_category(hhincome, c(1, 2, 3, 4)),
    `Household Income 20k to 45k` = prop_ci_category(hhincome, c(5, 6, 7)),
    `Household Income 45k to 75k` = prop_ci_category(hhincome, c(8, 9, 10)),
    `Household Income 75k to 100k` = prop_ci_category(hhincome, 14),
    `Household Income Over 100k` = prop_ci_category(hhincome, 15),
    `Age` = mean_ci(age)
  )

nhanes_without_vars_summary <- nhanes_without_vars %>%
  summarise(
    cluster = "Without BMI and/or Glycohemoglobin",
    `Male` = prop_ci_category(gender, 1),
    `Female` = prop_ci_category(gender, 2),
    `White` = prop_ci_category(race, 3),
    `Black` = prop_ci_category(race, 4),
    `Hispanic` = prop_ci_category(race, c(1, 2)),
    `Insured` = prop_ci_category(insured, 1),
    `Privately Insured` = prop_ci_category(insured_private, 1),
    `Insured by Medicare` = prop_ci_category(insured_medicare, 1),
    `Insured by Medicaid` = prop_ci_category(insured_medicaid, 1),
    `Household Income Under 20k` = prop_ci_category(hhincome, c(1, 2, 3, 4)),
    `Household Income 20k to 45k` = prop_ci_category(hhincome, c(5, 6, 7)),
    `Household Income 45k to 75k` = prop_ci_category(hhincome, c(8, 9, 10)),
    `Household Income 75k to 100k` = prop_ci_category(hhincome, 14),
    `Household Income Over 100k` = prop_ci_category(hhincome, 15),
    `Age` = mean_ci(age)
  )

analytic_sample_summary <- analytic_sample %>%
  summarise(
    cluster = "With BMI and Glycohemoglobin",
    `Male` = prop_ci_category(gender, 1),
    `Female` = prop_ci_category(gender, 2),
    `White` = prop_ci_category(race, 3),
    `Black` = prop_ci_category(race, 4),
    `Hispanic` = prop_ci_category(race, c(1, 2)),
    `Insured` = prop_ci_category(insured, 1),
    `Privately Insured` = prop_ci_category(insured_private, 1),
    `Insured by Medicare` = prop_ci_category(insured_medicare, 1),
    `Insured by Medicaid` = prop_ci_category(insured_medicaid, 1),
    `Household Income Under 20k` = prop_ci_category(hhincome, c(1, 2, 3, 4)),
    `Household Income 20k to 45k` = prop_ci_category(hhincome, c(5, 6, 7)),
    `Household Income 45k to 75k` = prop_ci_category(hhincome, c(8, 9, 10)),
    `Household Income 75k to 100k` = prop_ci_category(hhincome, 14),
    `Household Income Over 100k` = prop_ci_category(hhincome, 15),
    `Age` = mean_ci(age)
  )

# Invert rows and columns (transpose)
combined_nhanes_over18_summary <- t(combined_nhanes_over18_summary)

new_or_undiagnosed_dm_summary <- t(new_or_undiagnosed_dm_summary)

nhanes_with_vars_summary <- t(nhanes_with_vars_summary)

nhanes_without_vars_summary <- t(nhanes_without_vars_summary)

analytic_sample_summary <- t(analytic_sample_summary)

# Convert the result back to a data frame if needed
combined_nhanes_over18_summary <- as.data.frame(combined_nhanes_over18_summary)

new_or_undiagnosed_dm_summary <- as.data.frame(new_or_undiagnosed_dm_summary)

nhanes_with_vars_summary <- as.data.frame(nhanes_with_vars_summary)

nhanes_without_vars_summary <- as.data.frame(nhanes_without_vars_summary)

analytic_sample_summary <- as.data.frame(analytic_sample_summary)

# Combine summaries:
comparison_summary <- cbind(combined_nhanes_over18_summary, new_or_undiagnosed_dm_summary, nhanes_with_vars_summary,
                          nhanes_without_vars_summary, analytic_sample_summary)

# Save the resulting table:
write.csv(comparison_summary, file=paste0(path_nhanes_ckm_newdm, "/unweighted characteristics of different samples.csv"), row.names = TRUE)
