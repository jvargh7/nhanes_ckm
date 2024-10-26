### The purpose of this R file is to create a template for the R codes for KM curve and PH Cox regression analysis
rm(list=ls());gc();source(".Rprofile")


#### Load the required libraries
library(survival)
library(ggsurvfit)

source("analysis/ncan_analytic sample for survival.R")

analytic_sample_5y <- analytic_sample %>% 
  # event status
  mutate(mortstat = case_when(mortstat == 1 & censoring_time <= 60 ~ 1,
                              TRUE ~ 0),
         mortality_heart = case_when(ucod_leading == 1 & censoring_time <= 60 ~ 1,
                                     TRUE ~ 0),
         mortality_malignant_neoplasms = case_when(ucod_leading == 2 & censoring_time <= 60~ 1,
                                                   TRUE ~ 0),
         mortality_chronic_lower_respiratory  = case_when(ucod_leading == 3 & censoring_time <= 60 ~ 1,
                                                          TRUE ~ 0),
         mortality_accidents = case_when(ucod_leading == 4 & censoring_time <= 60 ~ 1,
                                         TRUE ~ 0),
         mortality_cerebrovascular = case_when(ucod_leading == 5 & censoring_time <= 60 ~ 1,
                                               TRUE ~ 0),
         mortality_alzheimer = case_when(ucod_leading == 6 & censoring_time <= 60 ~ 1,
                                         TRUE ~ 0),
         mortality_diabetes_mellitus = case_when(ucod_leading == 7 & censoring_time <= 60 ~ 1,
                                                 TRUE ~ 0),
         mortality_influenza_pneumonia  = case_when(ucod_leading == 8 & censoring_time <= 60 ~ 1,
                                                    TRUE ~ 0),
         mortality_nephrosis = case_when(ucod_leading == 9 & censoring_time <= 60 ~ 1,
                                         TRUE ~ 0),
         mortality_other = case_when(ucod_leading == 10 & censoring_time <= 60 ~ 1,
                                     TRUE ~ 0),
         censoring_time_5y = case_when(censoring_time > 60 ~ 60,
                                        TRUE ~ censoring_time)) 

analytic_sample_5y %>% 
  summarize(across(diseases,~mean(.)))  %>% 
  write_csv(.,"analysis/ncan05_overall rates for 5 year follow-up.csv")


regression_mortality = function(outcome_var,df){
  
  m1 <- coxph(as.formula(paste0("Surv(censoring_time_5y, ",outcome_var,") ~ cluster + dm_age")), # replace "t" with the time variable and "event" with the event variable in your dataset
              data = df)
  
  m2 <- coxph(as.formula(paste0("Surv(censoring_time_5y, ",outcome_var,") ~ cluster + gender + dm_age")),data=df) # replace "t" with the time variable and "event" with the event variable in your dataset
  
  m0 <- coxph(as.formula(paste0("Surv(censoring_time_5y, ",outcome_var,") ~ cluster")), # replace "t" with the time variable and "event" with the event variable in your dataset
              data = df)
  
  bind_rows(broom::tidy(m0) %>% mutate(model = "m0"),
            broom::tidy(m1) %>% mutate(model = "m1"),
            broom::tidy(m2) %>% mutate(model = "m2")
  ) %>% 
    mutate(outcome = outcome_var) %>% 
    return(.)
  
  
  
}

regression_results_5y <- list()
for (i in seq_along(diseases)) {
  print(i)
  regression_results_5y[[diseases[i]]] <- regression_mortality(outcome_var = diseases[i],
                                                                df = analytic_sample_5y)
  
  
}



regression_results_5y %>% 
  bind_rows() %>% 
  write_csv(.,"analysis/ncan05_survival analysis for 5 year follow-up.csv")


regression_results_5y %>% 
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

regression_results_5y %>% 
  bind_rows() %>% 
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96*std.error),
         uci = exp(estimate + 1.96*std.error),
         model = case_when(model == "m0" ~ "Unadjusted",
                           model == "m1" ~ "Age-adjusted",
                           model == "m2" ~ "Age- and sex-adjusted",
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
