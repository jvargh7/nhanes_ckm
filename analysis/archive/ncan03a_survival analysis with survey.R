rm(list=ls());gc();source(".Rprofile")

#### Load the required libraries
library(survival)
library(ggsurvfit)
library(survey)
######################## R script for Kaplan-Meier curve ################################

source("analysis/ncan_analytic sample for survival.R")

analytic_survey <- analytic_sample %>% 
  as_survey_design(.data=.,
                   ids = psu,
                   strata = pseudostratum,
                   weights = pooled_weight,
                   nest = TRUE,variance = "YG"
                    )

regression_mortality_svy <- function(outcome_var, analytic_svy) {
  
  m1 <- svycoxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster + dm_age")),
    design = analytic_svy
  )
  
  m2 <- svycoxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster + gender + dm_age + smoke_current")),
    design = analytic_svy
  )
  
  m0 <- svycoxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster")),
    design = analytic_svy
  )
  
  bind_rows(broom::tidy(m0) %>% mutate(model = "m0"),
            broom::tidy(m1) %>% mutate(model = "m1"),
            broom::tidy(m2) %>% mutate(model = "m2")) %>%
    mutate(outcome = outcome_var) %>%
    return(.)
}


regression_results <- list()

for (i in c(1:4)) {
  # print(i)
  # unadjusted_plots[[diseases[i]]] <- unadjusted_curves_mortality(outcome_var = diseases[i],
  #                                                                analytic_sample = analytic_sample,
  #                                                                outcome_label = disease_labels[i])
  # 
  # adjusted_plots[[diseases[i]]] <- adjusted_curves_mortality(outcome_var = diseases[i],
  #                                                            analytic_sample = analytic_sample,
  #                                                            outcome_label = disease_labels[i])
  regression_results[[diseases[i]]] <- regression_mortality_svy(outcome_var = diseases[i],
                                                                analytic_svy = analytic_survey)
}


regression_results %>%
  bind_rows() %>%
  write_csv(., "analysis/ncan03_survival_analysis_results.csv")

regression_results <- read_csv("analysis/ncan03a_survival_analysis_results with survey.csv")

regression_results %>%
  bind_rows() %>%
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96 * std.error),
         uci = exp(estimate + 1.96 * std.error),
         model = case_when(model == "m0" ~ "Unadjusted",
                           model == "m1" ~ "Age-adjusted",
                           model == "m2" ~ "Age-, sex-, and smoking-adjusted",
                           TRUE ~ NA_character_)) %>%
  dplyr::filter(model == "Age-adjusted",
                str_detect(term, "cluster")) %>%
  mutate(cluster = str_replace(term, "cluster", "")) %>%
  mutate(coef_ci = paste0(round(HR, 2), " (",
                          round(lci, 2), ", ",
                          round(uci, 2), ")"),
         outcome = factor(outcome, levels = diseases, labels = disease_labels)) %>%
  dplyr::select(outcome, cluster, coef_ci) %>%
  pivot_wider(names_from = cluster, values_from = coef_ci) %>%
  mutate(MARD = "Ref") %>%
  dplyr::select(outcome, MARD, MOD, SIDD, SIRD) %>%
  View()

regression_results %>%
  bind_rows() %>%
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96 * std.error),
         uci = exp(estimate + 1.96 * std.error),
         model = case_when(model == "m0" ~ "Unadjusted",
                           model == "m1" ~ "Adjusted",
                           TRUE ~ NA_character_)) %>%
  dplyr::filter(model == "Unadjusted",
                str_detect(term, "cluster")) %>%
  mutate(cluster = str_replace(term, "cluster", "")) %>%
  mutate(coef_ci = paste0(round(HR, 2), " (",
                          round(lci, 2), ", ",
                          round(uci, 2), ")"),
         outcome = factor(outcome, levels = diseases, labels = disease_labels)) %>%
  dplyr::select(outcome, cluster, coef_ci) %>%
  pivot_wider(names_from = cluster, values_from = coef_ci) %>%
  mutate(MARD = "Ref") %>%
  dplyr::select(outcome, MARD, MOD, SIDD, SIRD) %>%
  View()
