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
}
if(Sys.info()["user"] == "krishnasanaka"){
  path_nhanes_ckm_folder <- ""
  path_nhanes_ckm_repo <- ""
}
