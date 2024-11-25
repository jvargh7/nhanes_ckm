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

# Prepare the 5-year follow-up data with event status
analytic_sample_5y <- analytic_sample %>% 
  mutate(
    mortstat = case_when(mortstat == 1 & censoring_time <= 60 ~ 1, TRUE ~ 0),
    mortality_heart = case_when(ucod_leading == 1 & censoring_time <= 60 ~ 1, TRUE ~ 0),
    mortality_malignant_neoplasms = case_when(ucod_leading == 2 & censoring_time <= 60 ~ 1, TRUE ~ 0),
    mortality_any_other = case_when(ucod_leading == c(3, 4, 5, 6, 7, 8, 9, 10) & censoring_time <= 60 ~ 1,
                                    TRUE ~ 0),
    censoring_time_5y = case_when(censoring_time > 60 ~ 60, TRUE ~ censoring_time)
  )

# Save overall rates for 5-year follow-up
analytic_sample_5y %>% 
  summarize(across(diseases, ~mean(.))) %>% 
  write_csv("analysis/ncan05_overall rates for 5 year follow-up.csv")

# Define the regression function with survey weights
regression_mortality <- function(outcome_var, df) {
  
  # Cox models with survey weights
  m1 <- coxph(as.formula(paste0("Surv(censoring_time_5y, ", outcome_var, ") ~ cluster + dm_age")),
              data = df, 
              weights = pooled_weight)
  
  m2 <- coxph(as.formula(paste0("Surv(censoring_time_5y, ", outcome_var, ") ~ cluster + gender + dm_age")),
              data = df, 
              weights = pooled_weight)
  
  m0 <- coxph(as.formula(paste0("Surv(censoring_time_5y, ", outcome_var, ") ~ cluster")),
              data = df, 
              weights = pooled_weight)
  
  # Combine model results
  bind_rows(broom::tidy(m0) %>% mutate(model = "m0"),
            broom::tidy(m1) %>% mutate(model = "m1"),
            broom::tidy(m2) %>% mutate(model = "m2")) %>% 
    mutate(outcome = outcome_var) %>% 
    return(.)
}

# Run regression for each disease and save results
regression_results_5y <- list()
for (i in seq_along(diseases)) {
  print(i)
  regression_results_5y[[diseases[i]]] <- regression_mortality(outcome_var = diseases[i],
                                                               df = analytic_sample_5y)
}

# Save regression results to CSV
regression_results_5y %>% 
  bind_rows() %>% 
  write_csv("analysis/ncan05_survival analysis for 5 year follow-up.csv")

# Format regression results for viewing (Age- and sex-adjusted model)
regression_results_5y %>% 
  bind_rows() %>% 
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96 * std.error),
         uci = exp(estimate + 1.96 * std.error),
         model = case_when(model == "m0" ~ "Unadjusted",
                           model == "m1" ~ "Age-adjusted",
                           model == "m2" ~ "Age- and sex-adjusted",
                           TRUE ~ NA_character_)) %>% 
  dplyr::filter(model == "Age- and sex-adjusted",
                str_detect(term, "cluster")) %>% 
  mutate(cluster = str_replace(term, "cluster", "")) %>% 
  mutate(coef_ci = paste0(round(HR, 2), " (", round(lci, 2), ", ", round(uci, 2), ")"),
         outcome = factor(outcome, levels = diseases, labels = diseases)) %>% 
  dplyr::select(outcome, cluster, coef_ci) %>% 
  pivot_wider(names_from = cluster, values_from = coef_ci) %>% 
  mutate(MARD = "Ref") %>% 
  dplyr::select(outcome, MARD, MOD, SIDD, SIRD) %>% 
  View()

# Format and view unadjusted model results
regression_results_5y %>% 
  bind_rows() %>% 
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96 * std.error),
         uci = exp(estimate + 1.96 * std.error),
         model = case_when(model == "m0" ~ "Unadjusted",
                           model == "m1" ~ "Age-adjusted",
                           model == "m2" ~ "Age- and sex-adjusted",
                           TRUE ~ NA_character_)) %>% 
  dplyr::filter(model == "Unadjusted",
                str_detect(term, "cluster")) %>% 
  mutate(cluster = str_replace(term, "cluster", "")) %>% 
  mutate(coef_ci = paste0(round(HR, 2), " (", round(lci, 2), ", ", round(uci, 2), ")"),
         outcome = factor(outcome, levels = diseases, labels = diseases)) %>% 
  dplyr::select(outcome, cluster, coef_ci) %>% 
  pivot_wider(names_from = cluster, values_from = coef_ci) %>% 
  mutate(MARD = "Ref") %>% 
  dplyr::select(outcome, MARD, MOD, SIDD, SIRD) %>% 
  View()
