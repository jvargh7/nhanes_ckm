#### Load the required libraries
library(survival)
library(ggsurvfit)

######################## R script for Kaplan-Meier curve ################################

source("analysis/ncan_analytic sample for survival.R")

unadjusted_curves_mortality <- function(outcome_var, analytic_sample, outcome_label) {
  
  cox_reg <- coxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ strata(cluster)")),
    data = analytic_sample,
    weights = pooled_weight  # Add weights here
  )
  
  upper_limit = case_when(outcome_var == "mortstat" ~ 0.5,
                          outcome_var %in% c("mortality_heart", "mortality_malignant_neoplasms",
                                             "mortality_any_other") ~ 0.3,
                          TRUE ~ 0.1)
  seq_limit = case_when(outcome_var == "mortstat" ~ 0.1,
                        outcome_var %in% c("mortality_heart", "mortality_malignant_neoplasms",
                                           "mortality_any_other") ~ 0.05,
                        TRUE ~ 0.02)
  
  fig_out = ggsurvfit(survfit2(cox_reg), type = "risk") +
    xlab(paste0("Time to ", outcome_label)) +
    ylab("Event (proportion)") +
    add_confidence_interval() +
    theme_bw() +
    scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
    scale_fill_manual(name = "", values = cluster_colors_cosmos_all) +
    theme(axis.text = element_text(size = 8),
          legend.text = element_text(size = 8),
          legend.position = c(0.2, 0.8),
          axis.title = element_text(size = 8)) +
    scale_x_continuous(breaks = seq(0, 240, by = 60), limits = c(0, 280)) +
    scale_y_continuous(breaks = seq(0, upper_limit, by = seq_limit), limits = c(0, upper_limit)) +
    add_risktable()
  
  return(fig_out)
}

adjusted_curves_mortality <- function(outcome_var, analytic_sample, outcome_label) {
  
  upper_limit = case_when(outcome_var == "mortstat" ~ 0.5,
                          outcome_var %in% c("mortality_heart", "mortality_malignant_neoplasms",
                                             "mortality_any_other") ~ 0.3,
                          TRUE ~ 0.1)
  seq_limit = case_when(outcome_var == "mortstat" ~ 0.1,
                        outcome_var %in% c("mortality_heart", "mortality_malignant_neoplasms",
                                           "mortality_any_other") ~ 0.05,
                        TRUE ~ 0.02)
  
  cox_reg <- coxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ strata(cluster) + gender + dm_age")),
    data = analytic_sample,
    weights = pooled_weight  # Add weights here
  )
  
  fig_out = ggsurvfit(survfit2(cox_reg), type = "risk") +
    xlab(paste0("Time to ", outcome_label, " Mortality")) +
    ylab("Event (proportion)") +
    theme_bw() +
    scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
    theme(axis.text = element_text(size = 8),
          legend.text = element_text(size = 8),
          legend.position = c(0.2, 0.8),
          axis.title = element_text(size = 8)) +
    scale_x_continuous(breaks = seq(0, 240, by = 60), limits = c(0, 280)) +
    scale_y_continuous(breaks = seq(0, upper_limit, by = seq_limit), limits = c(0, upper_limit)) +
    add_risktable()
  
  return(fig_out)
}

regression_mortality <- function(outcome_var, analytic_sample) {
  
  m1 <- coxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster + dm_age")),
    data = analytic_sample,
    weights = pooled_weight  # Add weights here
  )
  
  m2 <- coxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster + gender + dm_age")),
    data = analytic_sample,
    weights = pooled_weight  # Add weights here
  )
  
  m0 <- coxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster")),
    data = analytic_sample,
    weights = pooled_weight  # Add weights here
  )
  
  bind_rows(broom::tidy(m0) %>% mutate(model = "m0"),
            broom::tidy(m1) %>% mutate(model = "m1"),
            broom::tidy(m2) %>% mutate(model = "m2")) %>%
    mutate(outcome = outcome_var) %>%
    return(.)
}

analytic_sample %>%
  summarize(across(diseases, ~mean(., na.rm = TRUE))) %>%
  write_csv(., "analysis/ncan03_overall rates for all follow-up.csv")

unadjusted_plots <- list()
adjusted_plots <- list()
regression_results <- list()

for (i in c(1:4)) {
  print(i)
  unadjusted_plots[[diseases[i]]] <- unadjusted_curves_mortality(outcome_var = diseases[i],
                                                                 analytic_sample = analytic_sample,
                                                                 outcome_label = disease_labels[i])
  
  adjusted_plots[[diseases[i]]] <- adjusted_curves_mortality(outcome_var = diseases[i],
                                                             analytic_sample = analytic_sample,
                                                             outcome_label = disease_labels[i])
  regression_results[[diseases[i]]] <- regression_mortality(outcome_var = diseases[i],
                                                            analytic_sample = analytic_sample)
}

library(ggpubr)
library(gridExtra)

# Increase font sizes and add margins to prevent labels from being cut off
combined_unadjusted_plot <- do.call(ggarrange, 
                                    c(unadjusted_plots, 
                                      list(ncol = 4, 
                                           nrow = 1, 
                                           common.legend = TRUE, 
                                           legend = "bottom"))) +
  theme(plot.title = element_text(size = 14),  # Adjust the title font size
        axis.title = element_text(size = 12), # Adjust axis title font size
        axis.text = element_text(size = 10),  # Adjust axis tick labels font size
        legend.text = element_text(size = 12),# Adjust legend font size
        legend.title = element_text(size = 12),
        plot.margin = margin(10, 10, 20, 10)) # Add extra space at the bottom

# Save the plot with adjusted dimensions and margins
ggsave(combined_unadjusted_plot, 
       filename = paste0(path_nhanes_ckm_folder, "/figures/KM curve by cause of death.png"), 
       width = 10,  # Adjusted width
       height = 6,  # Slightly increased height for x-axis labels
       dpi = 300)   # High resolution for clarity



combined_adjusted_plot <- do.call(ggarrange, c(adjusted_plots, list(ncol = 4, nrow = 1, common.legend = TRUE, legend = "bottom"))) %>%
  ggsave(., filename = paste0(path_nhanes_ckm_folder, "/figures/Adjusted Cumulative Incidence curve by cause of death.png"), width = 12, height = 4)

regression_results %>%
  bind_rows() %>%
  write_csv(., "analysis/ncan03_survival_analysis_results.csv")

regression_results <- read_csv("analysis/ncan03_survival_analysis_results.csv")

regression_results %>%
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
