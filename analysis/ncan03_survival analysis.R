### The purpose of this R file is to create a template for the R codes for KM curve and PH Cox regression analysis
rm(list=ls());gc();source(".Rprofile")


#### Load the required libraries
library(survival)
library(ggsurvfit)


######################## R script for Kaplan-Meier curve ################################

source("analysis/ncan_analytic sample for survival.R")



unadjusted_curves_mortality <- function(outcome_var,df,outcome_label){
  
  cox_reg <- coxph(as.formula(paste0("Surv(censoring_time, ",outcome_var,") ~ strata(cluster)")), # replace "t" with the time variable and "event" with the event variable in your dataset
                   data = df)
  
  upper_limit = case_when(outcome_var == "mortstat" ~ 0.5,
                          outcome_var %in% c("mortality_heart","mortality_malignant_neoplasms",
                                             "mortality_other") ~ 0.3,
                        TRUE ~ 0.1)
  seq_limit = case_when(outcome_var == "mortstat" ~ 0.1,
                        outcome_var %in% c("mortality_heart","mortality_malignant_neoplasms",
                                           "mortality_other") ~ 0.05,
                        TRUE ~ 0.02)
  
  
  # plot the survival curves (adjusted for other covariates) for the subphenotypes
  fig_out = ggsurvfit(survfit2(cox_reg), type = "risk") +
    xlab(paste0("Unadjusted time to ",outcome_label," Mortality")) +
    ylab("Event (proportion)") +
    add_confidence_interval() +
    theme_bw() +
    
    scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
    scale_fill_manual(name = "", values = cluster_colors_cosmos_all) + # you should replace "cluster_colors_cosmos_all" with your own color scheme for the subphenotypes
    theme(axis.text = element_text(size = 14),
          legend.text = element_text(size = 14), # feel free to adjust the figure size, font size, etc. to your preference
          legend.position = c(0.2, 0.8),
          axis.title = element_text(size = 16)) +
    scale_x_continuous(breaks = seq(0, 240, by = 60), limits = c(0, 280)) +
    scale_y_continuous(breaks = seq(0, upper_limit, by = seq_limit), limits = c(0, upper_limit)) +
    add_risktable()
  
  
  return(fig_out)
  
}

adjusted_curves_mortality <- function(outcome_var,df,outcome_label){
  
  upper_limit = case_when(outcome_var == "mortstat" ~ 0.5,
                          outcome_var %in% c("mortality_heart","mortality_malignant_neoplasms",
                                             "mortality_other") ~ 0.3,
                          TRUE ~ 0.1)
  seq_limit = case_when(outcome_var == "mortstat" ~ 0.1,
                        outcome_var %in% c("mortality_heart","mortality_malignant_neoplasms",
                                           "mortality_other") ~ 0.05,
                        TRUE ~ 0.02)
  
  
  cox_reg <- coxph(as.formula(paste0("Surv(censoring_time, ",outcome_var,") ~ strata(cluster) + gender + dm_age")), # replace "t" with the time variable and "event" with the event variable in your dataset
                   data = df)
  
  # plot the survival curves (adjusted for other covariates) for the subphenotypes
  fig_out = ggsurvfit(survfit2(cox_reg), type = "risk") +
    xlab(paste0("Time to ",outcome_label," Mortality")) +
    ylab("Event (proportion)") +
    add_confidence_interval() +
    theme_bw() +
    
    scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
    scale_fill_manual(name = "", values = cluster_colors_cosmos_all) + # you should replace "cluster_colors_cosmos_all" with your own color scheme for the subphenotypes
    theme(axis.text = element_text(size = 14),
          legend.text = element_text(size = 14), # feel free to adjust the figure size, font size, etc. to your preference
          legend.position = c(0.2, 0.8),
          axis.title = element_text(size = 16)) +
    scale_x_continuous(breaks = seq(0, 240, by = 60), limits = c(0, 280)) +
    scale_y_continuous(breaks = seq(0, upper_limit, by = seq_limit), limits = c(0, upper_limit)) +
    add_risktable()
  
  
  return(fig_out)
  
}


regression_mortality = function(outcome_var,df){
  
  m1 <- coxph(as.formula(paste0("Surv(censoring_time, ",outcome_var,") ~ cluster + dm_age")), # replace "t" with the time variable and "event" with the event variable in your dataset
              data = df)
  
  m2 <- coxph(as.formula(paste0("Surv(censoring_time, ",outcome_var,") ~ cluster + gender + dm_age")),data=df) # replace "t" with the time variable and "event" with the event variable in your dataset
  
  m0 <- coxph(as.formula(paste0("Surv(censoring_time, ",outcome_var,") ~ cluster")), # replace "t" with the time variable and "event" with the event variable in your dataset
                   data = df)
  
  bind_rows(broom::tidy(m0) %>% mutate(model = "m0"),
            broom::tidy(m1) %>% mutate(model = "m1"),
            broom::tidy(m2) %>% mutate(model = "m2")
            ) %>% 
    mutate(outcome = outcome_var) %>% 
    return(.)
  
  
  
}


analytic_sample %>% 
  summarize(across(diseases,~mean(.,na.rm=TRUE)))  %>% 
  write_csv(.,"analysis/ncan03_overall rates for all follow-up.csv")

# Loop through each disease to create and print plots
unadjusted_plots <- list()
adjusted_plots <- list()
regression_results <- list()
for (i in seq_along(diseases)) {
  print(i)
  unadjusted_plots[[diseases[i]]] <- unadjusted_curves_mortality(outcome_var = diseases[i],
                                               df = analytic_sample,
                                               outcome_label = disease_labels[i])
  
  adjusted_plots[[diseases[i]]] <- adjusted_curves_mortality(outcome_var = diseases[i],
                                                               df = analytic_sample,
                                                               outcome_label = disease_labels[i])
  regression_results[[diseases[i]]] <- regression_mortality(outcome_var = diseases[i],
                                                            df = analytic_sample)
  
  
}



library(ggpubr)

combined_unadjusted_plot <- do.call(ggarrange,c(unadjusted_plots, list(ncol = 3, nrow = 4, common.legend = TRUE,legend = "bottom")))  %>% 
  ggsave(.,filename=paste0(path_nhanes_ckm_folder,"/figures/KM curve by cause of death.jpg"),width=20,height =20)

combined_adjusted_plot <- do.call(ggarrange,c(adjusted_plots, list(ncol = 3, nrow = 4, common.legend = TRUE,legend = "bottom")))  %>% 
  ggsave(.,filename=paste0(path_nhanes_ckm_folder,"/figures/Adjusted Cumulative Incidence curve by cause of death.jpg"),width=20,height =20)


regression_results %>% 
  bind_rows() %>% 
  write_csv(.,"analysis/ncan03_survival analysis results.csv")


regression_results <- read_csv("analysis/ncan03_survival analysis results.csv")


regression_results %>% 
  bind_rows() %>% 
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96*std.error),
         uci = exp(estimate + 1.96*std.error),
         model = case_when(model == "m0" ~ "Unadjusted",
                           model == "m1" ~ "Age-adjusted",
                           model == "m2" ~ "Age- and sex-adjusted",
                           TRUE ~ NA_character_)) %>% 
  dplyr::filter(model == "Age- and sex-adjusted",
                str_detect(term,"cluster")) %>% 
  mutate(cluster = str_replace(term,"cluster","")) %>% 
  mutate(coef_ci = paste0(round(HR,2)," (",
                          round(lci,2),", ",
                          round(uci,2),")"),
         outcome = factor(outcome,levels=diseases,labels=disease_labels)) %>% 
  dplyr::select(outcome,cluster,coef_ci) %>% 
  pivot_wider(names_from=cluster,values_from=coef_ci) %>% 
  mutate(MARD = "Ref") %>% 
  dplyr::select(outcome,MARD,MOD,SIDD,SIRD) %>% 
  View()

regression_results %>% 
  bind_rows() %>% 
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96*std.error),
         uci = exp(estimate + 1.96*std.error),
         model = case_when(model == "m0" ~ "Unadjusted",
                           model == "m1" ~ "Adjusted",
                           TRUE ~ NA_character_)) %>% 
  dplyr::filter(model == "Unadjusted",
                str_detect(term,"cluster")) %>% 
  mutate(cluster = str_replace(term,"cluster","")) %>% 
  mutate(coef_ci = paste0(round(HR,2)," (",
                          round(lci,2),", ",
                          round(uci,2),")"),
         outcome = factor(outcome,levels=diseases,labels=disease_labels)) %>% 
  dplyr::select(outcome,cluster,coef_ci) %>% 
  pivot_wider(names_from=cluster,values_from=coef_ci) %>% 
  mutate(MARD = "Ref") %>% 
  dplyr::select(outcome,MARD,MOD,SIDD,SIRD) %>% 
  View()
