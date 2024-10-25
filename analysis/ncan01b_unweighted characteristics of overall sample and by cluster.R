rm(list=ls());gc();source(".Rprofile")

analytic_sample <- read.csv(paste0(path_nhanes_ckm_newdm,"/knn clusters.csv"), header = TRUE, sep = ",") %>% 
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
                              TRUE ~ ""))

source("functions/table1_summary.R")


c_vars = c("age","dm_age","bmi","fat_percentage","glycohemoglobin","alt","ast","sbp","dbp","egfr","waistcircumference","ldl","hdl","triglyceride","fasting_glucose")
g_vars = c("cluster","gender","race_eth","hhincome","insurance","insurance_type")

#-----------------------------------------------------------------------------------------------------------
### Table 1 by clusters

table_df = analytic_sample %>% 
  bind_rows(.,
            {.} %>% 
              mutate(cluster="Total")) %>% 
  table1_summary(.,c_vars = c_vars,g_vars = g_vars,id_vars = "cluster")

write_csv(table_df,"analysis/ncan01b_unweighted characteristics of overall sample and by cluster.csv")















