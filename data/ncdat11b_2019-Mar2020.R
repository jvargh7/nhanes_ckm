rm(list=ls());gc();source(".Rprofile")

nhanes_20172018 <- readRDS(file = paste0(path_nhanes_ckm_cleaned,"/nhanes_20172018.rds")) 
nhanes_2017Mar2020 <- readRDS(file = paste0(path_nhanes_ckm_cleaned,"/nhanes_2017Mar2020.rds"))


nhanes_2019Mar2020 <- nhanes_2017Mar2020 %>% 
  dplyr::filter(!respondentid %in% nhanes_20172018$respondentid)


saveRDS(nhanes_2019Mar2020, file = paste0(path_nhanes_ckm_cleaned,"/nhanes_2019Mar2020.rds"))