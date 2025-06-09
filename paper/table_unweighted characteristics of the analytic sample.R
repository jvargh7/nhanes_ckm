# Clear environment and load configuration
rm(list = ls()); gc(); source(".Rprofile")
library(readxl)

# Load the analytic sample
source("analysis/ncan_analytic sample for survival.R")

# Load the newly diagnosed DM
new_or_undiagnosed_dm <- readRDS(file = paste0(path_nhanes_ckm_newdm, "/new_or_undiagnosed_dm.rds"))

# Forming the excluded data set
excluded_sample <- new_or_undiagnosed_dm[!(new_or_undiagnosed_dm$respondentid %in% analytic_sample$respondentid), ]

# Merge HOMA2 indices and apply plausibility filters to excluded_sample
plausible_ranges <- list(
  bmi = c(10, 80),                 # kg/m^2
  waistcircumference = c(30, 200), # cm
  fat_percentage = c(2, 60),       # %
  sbp = c(70, 270),                # mmHg
  dbp = c(30, 150),                # mmHg
  triglyceride = c(10, 2000),      # mg/dL
  ldl = c(20, 400),                # mg/dL
  hdl = c(10, 150),                # mg/dL
  glycohemoglobin = c(3, 18),      # %
  fasting_glucose = c(30, 600),    # mg/dL
  serum_creatinine = c(0.1, 15),   # umol/L
  egfr = c(5, 250),                # mL/min/1.73m^2
  alt = c(0, 1000),                # mg/dL
  ast = c(0, 1000)                 # mg/dL
)

load_homa2_data <- function(path, sheets) {
  datasets <- list()
  
  for (sheet in sheets) {
    data <- read_excel(paste0(path, "/HOMA2 indices calculation/homa2 indices values.xlsx"),
                       sheet = sheet) 
    datasets[[sheet]] <- data
  }
  
  combined_data <- bind_rows(datasets)
  return(combined_data)
}

years_sheets <- c("19992000", "20012002", "20032004", "20052006", "20072008", 
                  "20092010", "20112012", "20132014", "20152016", "20172018", 
                  "2019Mar2020","20212023")

homa2_data <- load_homa2_data(path_nhanes_ckm_cleaned, years_sheets)


excluded_sample <- excluded_sample %>%
  left_join(homa2_data %>%
              dplyr::select(respondentid, year, `HOMA2 %B`, `HOMA2 IR`),
            by = c("respondentid", "year")) %>%
  rename(
    egfr = eGFR,
    homa2b = `HOMA2 %B`,
    homa2ir = `HOMA2 IR`
  ) %>%
  mutate(across(
    names(plausible_ranges),
    ~ ifelse(. < plausible_ranges[[cur_column()]][1] | . > plausible_ranges[[cur_column()]][2], NA, .),
    .names = "{.col}"
  )) %>%
  mutate(
    sbp = ifelse(sbp <= dbp, NA, sbp),
    dbp = ifelse(sbp <= dbp, NA, dbp),
    triglyceride = ifelse(triglyceride <= hdl, NA, triglyceride),
    hdl = ifelse(triglyceride <= hdl, NA, hdl)
  )

# Functions to calculate mean, SD, and CI for continuous variables (unweighted)
mean_sd_ci_unweighted <- function(variable, data) {
  x <- data[[variable]]
  x <- x[!is.na(x)]
  mean_est <- mean(x)
  sd_est <- sd(x)
  n <- length(x)
  se <- sd_est / sqrt(n)
  ci_lower <- mean_est - 1.96 * se
  ci_upper <- mean_est + 1.96 * se
  return(sprintf("%.1f (%.1f, %.1f) [%.1f]", mean_est, ci_lower, ci_upper, sd_est))
}

# Functions to calculate proportions and CI for categorical variables (unweighted)
prop_ci_category_unweighted <- function(variable, category, data) {
  x <- data[[variable]]
  temp_var <- ifelse(x %in% category, 1, 0)
  p <- mean(temp_var, na.rm = TRUE)
  n <- sum(!is.na(temp_var))
  se <- sqrt(p * (1 - p) / n)
  ci_lower <- p - 1.96 * se
  ci_upper <- p + 1.96 * se
  return(sprintf("%.1f%% (%.1f%%, %.1f%%)", p * 100, ci_lower * 100, ci_upper * 100))
}

# Unweighted sample size
unweighted_n <- function(data) {
  return(nrow(data))
}

# Create overall summary table
overall_summary <- data.frame(
  cluster = "Overall",
  N = unweighted_n(analytic_sample),
  Male = prop_ci_category_unweighted("gender", 1, analytic_sample),
  Female = prop_ci_category_unweighted("gender", 2, analytic_sample),
  NH_White = prop_ci_category_unweighted("race", 3, analytic_sample),
  NH_Black = prop_ci_category_unweighted("race", 4, analytic_sample),
  Hispanic = prop_ci_category_unweighted("race", c(1, 2), analytic_sample),
  Other_Race = prop_ci_category_unweighted("race", 5, analytic_sample),
  Insured = prop_ci_category_unweighted("insured", 1, analytic_sample),
  Uninsured = prop_ci_category_unweighted("insured", 2, analytic_sample),
  Privately_Insured = prop_ci_category_unweighted("insured_private", 1, analytic_sample),
  Insured_by_Medicare = prop_ci_category_unweighted("insured_medicare", 1, analytic_sample),
  Insured_by_Medicaid = prop_ci_category_unweighted("insured_medicaid", 1, analytic_sample),
  Household_Income_Under_20k = prop_ci_category_unweighted("hhincome", c(1, 2, 3, 4, 13), analytic_sample),
  Household_Income_20k_to_45k = prop_ci_category_unweighted("hhincome", c(5, 6, 7), analytic_sample),
  Household_Income_45k_to_75k = prop_ci_category_unweighted("hhincome", c(8, 9, 10), analytic_sample),
  Household_Income_Over_75k = prop_ci_category_unweighted("hhincome", c(11, 14, 15), analytic_sample),
  Household_Income_Other = prop_ci_category_unweighted("hhincome", c(12, 77, 99), analytic_sample),
  Age = mean_sd_ci_unweighted("age", analytic_sample),
  Age_of_DM_Diagnosis = mean_sd_ci_unweighted("dm_age", analytic_sample),
  Body_Mass_Index = mean_sd_ci_unweighted("bmi", analytic_sample),
  Body_Fat_Percentage = mean_sd_ci_unweighted("fat_percentage", analytic_sample),
  Waist_Circumference = mean_sd_ci_unweighted("waistcircumference", analytic_sample),
  Glycohemoglobin = mean_sd_ci_unweighted("glycohemoglobin", analytic_sample),
  Fasting_Glucose = mean_sd_ci_unweighted("fasting_glucose", analytic_sample),
  LDL = mean_sd_ci_unweighted("ldl", analytic_sample),
  HDL = mean_sd_ci_unweighted("hdl", analytic_sample),
  SBP = mean_sd_ci_unweighted("sbp", analytic_sample),
  DBP = mean_sd_ci_unweighted("dbp", analytic_sample),
  Triglycerides = mean_sd_ci_unweighted("triglyceride", analytic_sample),
  HOMA2_B = mean_sd_ci_unweighted("homa2b", analytic_sample),
  HOMA2_IR = mean_sd_ci_unweighted("homa2ir", analytic_sample),
  eGFR = mean_sd_ci_unweighted("egfr", analytic_sample),
  ALT = mean_sd_ci_unweighted("alt", analytic_sample),
  AST = mean_sd_ci_unweighted("ast", analytic_sample)
)

# Create cluster-specific summary table
clusters <- unique(analytic_sample$cluster)
cluster_summary <- data.frame()

for (cluster_id in clusters) {
  cluster_data <- subset(analytic_sample, cluster == cluster_id)
  
  cluster_summary_row <- data.frame(
    cluster = cluster_id,
    N = unweighted_n(cluster_data),
    Male = prop_ci_category_unweighted("gender", 1, cluster_data),
    Female = prop_ci_category_unweighted("gender", 2, cluster_data),
    NH_White = prop_ci_category_unweighted("race", 3, cluster_data),
    NH_Black = prop_ci_category_unweighted("race", 4, cluster_data),
    Hispanic = prop_ci_category_unweighted("race", c(1, 2), cluster_data),
    Other_Race = prop_ci_category_unweighted("race", 5, cluster_data),
    Insured = prop_ci_category_unweighted("insured", 1, cluster_data),
    Uninsured = prop_ci_category_unweighted("insured", 2, cluster_data),
    Privately_Insured = prop_ci_category_unweighted("insured_private", 1, cluster_data),
    Insured_by_Medicare = prop_ci_category_unweighted("insured_medicare", 1, cluster_data),
    Insured_by_Medicaid = prop_ci_category_unweighted("insured_medicaid", 1, cluster_data),
    Household_Income_Under_20k = prop_ci_category_unweighted("hhincome", c(1, 2, 3, 4, 13), cluster_data),
    Household_Income_20k_to_45k = prop_ci_category_unweighted("hhincome", c(5, 6, 7), cluster_data),
    Household_Income_45k_to_75k = prop_ci_category_unweighted("hhincome", c(8, 9, 10), cluster_data),
    Household_Income_Over_75k = prop_ci_category_unweighted("hhincome", c(11, 14, 15), cluster_data),
    Household_Income_Other = prop_ci_category_unweighted("hhincome", c(12, 77, 99), cluster_data),
    Age = mean_sd_ci_unweighted("age", cluster_data),
    Age_of_DM_Diagnosis = mean_sd_ci_unweighted("dm_age", cluster_data),
    Body_Mass_Index = mean_sd_ci_unweighted("bmi", cluster_data),
    Body_Fat_Percentage = mean_sd_ci_unweighted("fat_percentage", cluster_data),
    Waist_Circumference = mean_sd_ci_unweighted("waistcircumference", cluster_data),
    Glycohemoglobin = mean_sd_ci_unweighted("glycohemoglobin", cluster_data),
    Fasting_Glucose = mean_sd_ci_unweighted("fasting_glucose", cluster_data),
    LDL = mean_sd_ci_unweighted("ldl", cluster_data),
    HDL = mean_sd_ci_unweighted("hdl", cluster_data),
    SBP = mean_sd_ci_unweighted("sbp", cluster_data),
    DBP = mean_sd_ci_unweighted("dbp", cluster_data),
    Triglycerides = mean_sd_ci_unweighted("triglyceride", cluster_data),
    HOMA2_B = mean_sd_ci_unweighted("homa2b", cluster_data),
    HOMA2_IR = mean_sd_ci_unweighted("homa2ir", cluster_data),
    eGFR = mean_sd_ci_unweighted("egfr", cluster_data),
    ALT = mean_sd_ci_unweighted("alt", cluster_data),
    AST = mean_sd_ci_unweighted("ast", cluster_data)
  )
  
  cluster_summary <- rbind(cluster_summary, cluster_summary_row)
}

# Create summary for excluded sample
excluded_summary <- data.frame(
  cluster = "Excluded",
  N = unweighted_n(excluded_sample),
  Male = prop_ci_category_unweighted("gender", 1, excluded_sample),
  Female = prop_ci_category_unweighted("gender", 2, excluded_sample),
  NH_White = prop_ci_category_unweighted("race", 3, excluded_sample),
  NH_Black = prop_ci_category_unweighted("race", 4, excluded_sample),
  Hispanic = prop_ci_category_unweighted("race", c(1, 2), excluded_sample),
  Other_Race = prop_ci_category_unweighted("race", 5, excluded_sample),
  Insured = prop_ci_category_unweighted("insured", 1, excluded_sample),
  Uninsured = prop_ci_category_unweighted("insured", 2, excluded_sample),
  Privately_Insured = prop_ci_category_unweighted("insured_private", 1, excluded_sample),
  Insured_by_Medicare = prop_ci_category_unweighted("insured_medicare", 1, excluded_sample),
  Insured_by_Medicaid = prop_ci_category_unweighted("insured_medicaid", 1, excluded_sample),
  Household_Income_Under_20k = prop_ci_category_unweighted("hhincome", c(1, 2, 3, 4, 13), excluded_sample),
  Household_Income_20k_to_45k = prop_ci_category_unweighted("hhincome", c(5, 6, 7), excluded_sample),
  Household_Income_45k_to_75k = prop_ci_category_unweighted("hhincome", c(8, 9, 10), excluded_sample),
  Household_Income_Over_75k = prop_ci_category_unweighted("hhincome", c(11, 14, 15), excluded_sample),
  Household_Income_Other = prop_ci_category_unweighted("hhincome", c(12, 77, 99), excluded_sample),
  Age = mean_sd_ci_unweighted("age", excluded_sample),
  Age_of_DM_Diagnosis = mean_sd_ci_unweighted("dm_age", excluded_sample),
  Body_Mass_Index = mean_sd_ci_unweighted("bmi", excluded_sample),
  Body_Fat_Percentage = mean_sd_ci_unweighted("fat_percentage", excluded_sample),
  Waist_Circumference = mean_sd_ci_unweighted("waistcircumference", excluded_sample),
  Glycohemoglobin = mean_sd_ci_unweighted("glycohemoglobin", excluded_sample),
  Fasting_Glucose = mean_sd_ci_unweighted("fasting_glucose", excluded_sample),
  LDL = mean_sd_ci_unweighted("ldl", excluded_sample),
  HDL = mean_sd_ci_unweighted("hdl", excluded_sample),
  SBP = mean_sd_ci_unweighted("sbp", excluded_sample),
  DBP = mean_sd_ci_unweighted("dbp", excluded_sample),
  Triglycerides = mean_sd_ci_unweighted("triglyceride", excluded_sample),
  HOMA2_B = mean_sd_ci_unweighted("homa2b", excluded_sample),
  HOMA2_IR = mean_sd_ci_unweighted("homa2ir", excluded_sample),
  eGFR = mean_sd_ci_unweighted("egfr", excluded_sample),
  ALT = mean_sd_ci_unweighted("alt", excluded_sample),
  AST = mean_sd_ci_unweighted("ast", excluded_sample)
)

# Transpose and combine overall, cluster-specific, and excluded summaries
overall_summary <- t(overall_summary) |> as.data.frame()
cluster_summary <- t(cluster_summary) |> as.data.frame()
excluded_summary <- t(excluded_summary) |> as.data.frame()

# Combine all
combined_summary <- cbind(overall_summary, cluster_summary, excluded_summary)

# Save the resulting table
write.csv(combined_summary,
          file = paste0(path_nhanes_ckm_newdm, "/unweighted characteristics of overall sample, by cluster, and excluded.csv"),
          row.names = TRUE)
