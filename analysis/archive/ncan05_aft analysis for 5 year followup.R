rm(list=ls());gc();source(".Rprofile")

#### Load the required libraries
library(survival)
library(ggsurvfit)

source("analysis/ncan_analytic sample for survival.R")


analytic_sample_5y = analytic_sample %>% 
  mutate(
    mortstat = case_when(mortstat == 1 & censoring_time <= 120 ~ 1, TRUE ~ 0),
    mortality_heart = case_when(ucod_leading == 1 & censoring_time <= 120 ~ 1, TRUE ~ 0),
    mortality_malignant_neoplasms = case_when(ucod_leading == 2 & censoring_time <= 120 ~ 1, TRUE ~ 0),
    mortality_any_other = case_when(ucod_leading %in% c(3, 4, 5, 6, 7, 8, 9, 10) & censoring_time <= 120 ~ 1,
                                    TRUE ~ 0),
    censoring_time_5y = case_when(censoring_time > 120 ~ 120, TRUE ~ censoring_time)
  )

analytic_svy = analytic_sample_5y %>% svydesign(data = ., id = ~psu, strata = ~pseudostratum, weights = ~pooled_weight, nest = TRUE)

aft21 <- survreg(Surv(censoring_time_5y,mortstat) ~ cluster  + gender + dm_age + smoke_current, data=analytic_sample_5y,dist="loglogistic")
aft22 <- survreg(Surv(censoring_time_5y,mortality_heart) ~ cluster  + gender + dm_age + smoke_current, data=analytic_sample_5y,dist="loglogistic")
aft23 <- survreg(Surv(censoring_time_5y,mortality_malignant_neoplasms) ~ cluster  + gender + dm_age  + smoke_current, data=analytic_sample_5y,dist="loglogistic")
aft24 <- survreg(Surv(censoring_time_5y,mortality_any_other) ~ cluster  + gender + dm_age  + smoke_current, data=analytic_sample_5y,dist="loglogistic")

summary(aft21)
summary(aft22)
summary(aft23)
summary(aft24)





svyaft01 <- svysurvreg(Surv(censoring_time_5y,mortstat) ~ cluster, design=analytic_svy,dist="loglogistic")
svyaft02 <- svysurvreg(Surv(censoring_time_5y,mortality_heart) ~ cluster, design=analytic_svy,dist="loglogistic")
svyaft03 <- svysurvreg(Surv(censoring_time_5y,mortality_malignant_neoplasms) ~ cluster, design=analytic_svy,dist="loglogistic")
svyaft04 <- svysurvreg(Surv(censoring_time_5y,mortality_any_other) ~ cluster, design=analytic_svy,dist="loglogistic")

summary(svyaft01)
summary(svyaft02)
summary(svyaft03)
summary(svyaft04)


svyaft11 <- svysurvreg(Surv(censoring_time_5y,mortstat) ~ cluster + dm_age, design=analytic_svy,dist="loglogistic")
svyaft12 <- svysurvreg(Surv(censoring_time_5y,mortality_heart) ~ cluster + dm_age, design=analytic_svy,dist="loglogistic")
svyaft13 <- svysurvreg(Surv(censoring_time_5y,mortality_malignant_neoplasms) ~ cluster + dm_age, design=analytic_svy,dist="loglogistic")
svyaft14 <- svysurvreg(Surv(censoring_time_5y,mortality_any_other) ~ cluster + dm_age, design=analytic_svy,dist="loglogistic")

summary(svyaft11)
summary(svyaft12)
summary(svyaft13)
summary(svyaft14)


svyaft21 <- svysurvreg(Surv(censoring_time_5y,mortstat) ~ cluster  + gender + dm_age + smoke_current, design=analytic_svy,dist="loglogistic")
svyaft22 <- svysurvreg(Surv(censoring_time_5y,mortality_heart) ~ cluster  + gender + dm_age + smoke_current, design=analytic_svy,dist="loglogistic")
svyaft23 <- svysurvreg(Surv(censoring_time_5y,mortality_malignant_neoplasms) ~ cluster  + gender + dm_age  + smoke_current, design=analytic_svy,dist="loglogistic")
svyaft24 <- svysurvreg(Surv(censoring_time_5y,mortality_any_other) ~ cluster  + gender + dm_age  + smoke_current, design=analytic_svy,dist="loglogistic")

summary(svyaft21)
summary(svyaft22)
summary(svyaft23)
summary(svyaft24)


ncan05 <- bind_rows(
  broom::tidy(svyaft01) %>% mutate(model = "m0",outcome = "mortstat"),
  broom::tidy(svyaft02) %>% mutate(model = "m0",outcome = "mortality_heart"),
  broom::tidy(svyaft03) %>% mutate(model = "m0",outcome = "mortality_malignant_neoplasms"),
  broom::tidy(svyaft04) %>% mutate(model = "m0",outcome = "mortality_any_other"),
  
  broom::tidy(svyaft11) %>% mutate(model = "m1",outcome = "mortstat"),
  broom::tidy(svyaft12) %>% mutate(model = "m1",outcome = "mortality_heart"),
  broom::tidy(svyaft13) %>% mutate(model = "m1",outcome = "mortality_malignant_neoplasms"),
  broom::tidy(svyaft14) %>% mutate(model = "m1",outcome = "mortality_any_other"),
  
  broom::tidy(svyaft21) %>% mutate(model = "m2",outcome = "mortstat"),
  broom::tidy(svyaft22) %>% mutate(model = "m2",outcome = "mortality_heart"),
  broom::tidy(svyaft23) %>% mutate(model = "m2",outcome = "mortality_malignant_neoplasms"),
  broom::tidy(svyaft24) %>% mutate(model = "m2",outcome = "mortality_any_other")
  
  
) %>% 
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96 * std.error),
         uci = exp(estimate + 1.96 * std.error)) 


write_csv(ncan05,"analysis/ncan05_coefficients of aft analysis for 5y followup.csv")
