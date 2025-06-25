# Purpose: Template for Kaplan-Meier curve and Cox PH regression analysis with survey weights
rm(list=ls()); gc(); source(".Rprofile")

# Load the required libraries
library(survival)
library(ggsurvfit)
library(dplyr)
library(broom)
library(tidyr)

source("analysis/ncan_analytic sample for survival.R")

# Define only the four outcomes of interest
diseases <- c("mortstat", "mortality_heart", "mortality_malignant_neoplasms", "mortality_any_other")

# Prepare the 10-year follow-up data with event status
analytic_sample_10y <- analytic_sample_with_not2d %>% 
  mutate(
    mortstat = case_when(mortstat == 1 & censoring_time <= 120 ~ 1, TRUE ~ 0),
    mortality_heart = case_when(ucod_leading == 1 & censoring_time <= 120 ~ 1, TRUE ~ 0),
    mortality_malignant_neoplasms = case_when(ucod_leading == 2 & censoring_time <= 120 ~ 1, TRUE ~ 0),
    mortality_any_other = case_when(ucod_leading %in% c(3, 4, 5, 6, 7, 8, 9, 10) & censoring_time <= 120 ~ 1,
                                    TRUE ~ 0),
    censoring_time_10y = case_when(censoring_time > 120 ~ 120, TRUE ~ censoring_time)
  )

# Save overall rates for 10-year follow-up
analytic_sample_10y %>% 
  summarize(across(diseases, ~mean(.))) %>% 
  write_csv("analysis/ncan14_overall rates for 10 year follow-up with no T2D.csv")


analytic_sample_10y %>% 
  dplyr::select(one_of(diseases)) %>% 
  summarize_all(~sum(.,na.rm=TRUE))

source("functions/regression_mortality.R")


# Run regression for each disease and save results
regression_results_10y <- list()
pdf(file=paste0(path_nhanes_ckm_folder,"/figures/ncan14_PH Assumption 10y.pdf"))
for (i in seq_along(diseases)) {
  print(i)
  regression_results_10y[[diseases[i]]] <- regression_mortality(outcome_var = diseases[i],
                                                                df = analytic_sample_10y,
                                                                cluster_vars = c("cluster_MARD","cluster_MOD","cluster_SIDD","cluster_SIRD"), include_s3_wo_duration = TRUE)
}
dev.off()
# Save regression results to CSV
regression_results_10y %>% 
  bind_rows() %>% 
  write_csv("analysis/ncan14_survival analysis for 10 year follow-up with no T2D.csv")


read_csv("analysis/ncan14_survival analysis for 10 year follow-up with no T2D.csv") %>% View()
