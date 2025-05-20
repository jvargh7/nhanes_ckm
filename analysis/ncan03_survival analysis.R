rm(list=ls());gc();source(".Rprofile")

#### Load the required libraries
library(survival)
library(ggsurvfit)

######################## R script for Kaplan-Meier curve ################################

source("analysis/ncan_analytic sample for survival.R")

regression_mortality <- function(outcome_var, df) {
  
  des = svydesign(id = ~psu, strata = ~pseudostratum, weights = ~pooled_weight, data = df, nest = TRUE)
  
  
  m1 <- coxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD + dm_age")),
    data = df
    # weights = pooled_weight  # Add weights here
  )
  
  m2 <- coxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD + gender + dm_age + smoke_current")),
    data = df
    # weights = pooled_weight  # Add weights here
  )
  
  m0 <- coxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD")),
    data = df
    # weights = pooled_weight  # Add weights here
  )
  
  s2 <- svycoxph(as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD + gender + dm_age + smoke_current")),
                 design = des
  )
  
  s0 <- svycoxph(as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD")),
                 design = des
  )
  
  # t0 <- svycoxph(as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD + tt(cluster_MOD)")),
  #                design = des)
  
  NPH_CHECK = cox.zph(s2)
  NPH_CHECK_unweighted = cox.zph(m2)
  # NPH_CHECK_t = cox.zph(t0)
  
  
  par(mfrow=c(2,3))
  plot(NPH_CHECK_unweighted)
  mtext(paste0(disease_labels[outcome_var]," - Overall (Unweighted)"), side = 3, line = - 2, outer = TRUE)
  
  par(mfrow=c(2,3))
  plot(NPH_CHECK)
  mtext(paste0(disease_labels[outcome_var]," - Overall (Weighted)"), side = 3, line = - 2, outer = TRUE)
  

  
  bind_rows(broom::tidy(m0) %>% mutate(model = "m0"),
            broom::tidy(m1) %>% mutate(model = "m1"),
            broom::tidy(m2) %>% mutate(model = "m2"),
            broom::tidy(s0) %>% mutate(model = "s0"),
            broom::tidy(s2) %>% mutate(model = "s2")
            ) %>%
    mutate(outcome = outcome_var) %>%
    return(.)
}

analytic_sample %>%
  summarize(across(diseases, ~mean(., na.rm = TRUE))) %>%
  write_csv(., "analysis/ncan03_overall rates for all follow-up.csv")

analytic_sample %>% 
  dplyr::select(one_of(diseases)) %>% 
  summarize_all(~sum(.,na.rm=TRUE))

analytic_sample %>% 
  group_by(cluster) %>% 
  summarize(q = quantile(censoring_time,probs=c(0.25,0.5,0.75)))


regression_results <- list()

pdf(file=paste0(path_nhanes_ckm_folder,"/figures/ncan03_PH Assumption.pdf"))
for (i in c(1:4)) {
  regression_results[[diseases[i]]] <- regression_mortality(outcome_var = diseases[i],
                                                            df = analytic_sample)
}
dev.off()


regression_results %>%
  bind_rows() %>%
  write_csv(., "analysis/ncan03_survival analysis results.csv")

regression_results <- read_csv("analysis/ncan03_survival analysis results.csv")

regression_results %>%
  bind_rows() %>%
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96 * std.error),
         uci = exp(estimate + 1.96 * std.error),
         model = case_when(model == "m0" ~ "Unadjusted",
                           model == "m1" ~ "Age-adjusted",
                           model == "m2" ~ "Age-, sex-, and smoking-adjusted",
                           model == "s0" ~ "Survey Unadjusted",
                           model == "s2" ~ "Survey Age-, sex-, and smoking-adjusted",
                           TRUE ~ NA_character_)) %>%
  dplyr::filter(model == "Age-adjusted",
                str_detect(term, "cluster")) %>%
  mutate(cluster = str_replace(term, "cluster_", "")) %>%
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
  mutate(cluster = str_replace(term, "cluster_", "")) %>%
  mutate(coef_ci = paste0(round(HR, 2), " (",
                          round(lci, 2), ", ",
                          round(uci, 2), ")"),
         outcome = factor(outcome, levels = diseases, labels = disease_labels)) %>%
  dplyr::select(outcome, cluster, coef_ci) %>%
  pivot_wider(names_from = cluster, values_from = coef_ci) %>%
  mutate(MARD = "Ref") %>%
  dplyr::select(outcome, MARD, MOD, SIDD, SIRD) %>%
  View()
