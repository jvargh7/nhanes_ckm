rm(list=ls());gc();source(".Rprofile")

combined_nhanes_over18 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/new diabetes/combined_nhanes_over18.rds"))
new_or_undiagnosed_dm <- readRDS(paste0(path_nhanes_ckm_folder,"/working/new diabetes/new_or_undiagnosed_dm.rds"))
nhanes_with_vars <- readRDS(paste0(path_nhanes_ckm_folder,"/working/new diabetes/nhanes_with_vars.rds"))
nhanes_without_vars <- readRDS(paste0(path_nhanes_ckm_folder,"/working/new diabetes/nhanes_without_vars.rds"))


over18_df <- combined_nhanes_over18 %>% 
  mutate(newdm = case_when(respondentid %in% new_or_undiagnosed_dm$respondentid ~ "newdm",
                           TRUE ~ "non_newdm")) %>% 
  mutate(race_eth = case_when(race == 1 | race == 2 ~ "Hispanic",
                              race == 3 ~ "NH White",
                              race == 4 ~ "NH Black",
                              TRUE ~ "Other race"),
         gender = case_when(gender == 1 ~ "Male",
                            TRUE ~ "Female"),
         insurance = case_when(insured == 1 ~ "Covered by health insurance",
                               insured == 2 ~ "No health insurance",
                               TRUE ~ ""),
         insurance_type = case_when(insured_private == 1 ~ "Privately Insured",
                                    insured_medicare == 1 ~ "Insured by Medicare",
                                    insured_medicaid == 1 ~ "Insured by Medicaid",
                                    TRUE ~ ""),
         hhincome = case_when(hhincome %in% c(1,2,3,4) ~ "Household Income Under 20k",
                              hhincome %in% c(5,6,7) ~ "Household Income 20k to 45k",
                              hhincome %in% c(8,9,10) ~ "Household Income 45k to 75k",
                              hhincome == 14 ~ "Household Income 75k to 100k",
                              hhincome == 15 ~ "Household Income Over 100k",
                              TRUE ~ "")) %>% 
  rename(egfr = eGFR)

newdm_df <- new_or_undiagnosed_dm %>% 
  mutate(vars_ava = case_when(respondentid %in% nhanes_with_vars$respondentid ~ "var_available",
                              TRUE ~ "var_notavailable")) %>% 
  mutate(race_eth = case_when(race == 1 | race == 2 ~ "Hispanic",
                              race == 3 ~ "NH White",
                              race == 4 ~ "NH Black",
                              TRUE ~ "Other race"),
         gender = case_when(gender == 1 ~ "Male",
                            TRUE ~ "Female"),
         insurance = case_when(insured == 1 ~ "Covered by health insurance",
                               insured == 2 ~ "No health insurance",
                               TRUE ~ ""),
         insurance_type = case_when(insured_private == 1 ~ "Privately Insured",
                                    insured_medicare == 1 ~ "Insured by Medicare",
                                    insured_medicaid == 1 ~ "Insured by Medicaid",
                                    TRUE ~ ""),
         hhincome = case_when(hhincome %in% c(1,2,3,4) ~ "Household Income Under 20k",
                              hhincome %in% c(5,6,7) ~ "Household Income 20k to 45k",
                              hhincome %in% c(8,9,10) ~ "Household Income 45k to 75k",
                              hhincome == 14 ~ "Household Income 75k to 100k",
                              hhincome == 15 ~ "Household Income Over 100k",
                              TRUE ~ "")) %>% 
  rename(egfr = eGFR)

#-----------------------------------------------------------------------------------------------------------
### Table 2 by sample

source("functions/table1_summary.R")


c_vars = c("age","dm_age","bmi","fat_percentage","glycohemoglobin","alt","ast","sbp","dbp","egfr","waistcircumference","ldl","hdl","triglyceride","fasting_glucose")
g_vars = c("gender","race_eth","hhincome","insurance","insurance_type")

table_df = over18_df %>% 
  bind_rows(.,
            {.} %>% 
              mutate(newdm="Total")) %>% 
  table1_summary(.,c_vars = c_vars,g_vars = g_vars,id_vars = "newdm")

write_csv(table_df,"analysis/ncan02b_unweighted characteristics of all by sample.csv")

#-----------------------------------------------------------------------------------------------------------

table_df = newdm_df %>% 
  bind_rows(.,
            {.} %>% 
              mutate(vars_ava="Total")) %>% 
  table1_summary(.,c_vars = c_vars,g_vars = g_vars,id_vars = "vars_ava")

write_csv(table_df,"analysis/ncan02b_unweighted characteristics of newly or undiagnosed by sample.csv")

