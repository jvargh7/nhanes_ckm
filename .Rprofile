library(haven)
library(tidyverse)
library(survey)
library(srvyr)
library(lubridate)

options(survey.adjust.domain.lonely=TRUE)
options(survey.lonely.psu="adjust")

if(Sys.info()["user"] == "JVARGH7"){
  path_nhanes_ckm_folder <- "C:/Cloud/OneDrive - Emory University/Papers/NHANES CKM Cascade"
  path_nhanes_ckm_repo <- "C:/code/external/nhanes_ckm"
  
  path_nhanes_ckm_raw <- paste0(path_nhanes_ckm_folder,"/working/raw")
  path_nhanes_ckm_cleaned <- paste0(path_nhanes_ckm_folder,"/working/cleaned")
  path_nhanes_ckm_variable_list <- paste0(path_nhanes_ckm_repo,"/data/CKM Variable List.xlsx")
  
}
if(Sys.info()["user"] == "krishnasanaka"){
  path_nhanes_ckm_folder <- "/Users/krishnasanaka/Desktop/Public Health Research/CKM"
  path_nhanes_ckm_repo <- "/Users/krishnasanaka/nhanes_ckm"
  
  path_nhanes_ckm_raw <- paste0(path_nhanes_ckm_folder,"/Datasets")
  path_nhanes_ckm_cleaned <- paste0(path_nhanes_ckm_folder,"/NHANES RDS")
  path_nhanes_ckm_variable_list <- paste0(path_nhanes_ckm_folder,"/CKM Variable List Updated.xlsx")
  
}
