library(haven)
library(tidyverse)
library(survey)
library(srvyr)
library(lubridate)
library(reticulate)

options(survey.adjust.domain.lonely=TRUE)
options(survey.lonely.psu="adjust")

if(Sys.info()["user"] == "JVARGH7"){
  path_nhanes_ckm_folder <- "C:/Cloud/OneDrive - Emory University/Papers/NHANES Subtypes Mortality"
  path_nhanes_ckm_repo <- "C:/code/external/nhanes_ckm"
  
  path_nhanes_ckm_raw <- paste0(path_nhanes_ckm_folder,"/working/raw")
  path_nhanes_ckm_cleaned <- paste0(path_nhanes_ckm_folder,"/working/cleaned")
  path_nhanes_ckm_newdm <- paste0(path_nhanes_ckm_folder,"/working/new diabetes")
  path_nhanes_ckm_variable_list <- paste0(path_nhanes_ckm_repo,"/data/CKM Variable List.xlsx")
  
}
if(Sys.info()["user"] == "krishnasanaka"){
  # Install the necessary Python packages
  reticulate::use_virtualenv("~/.virtualenvs/r-reticulate", required = TRUE)
  reticulate::py_install(c("numpy", "pandas", "scikit-learn", "matplotlib", "seaborn", "kneed"), pip = TRUE)
  
  path_nhanes_ckm_folder <- "/Users/krishnasanaka/Library/CloudStorage/OneDrive-Emory/NHANES CKM Cascade"
  path_nhanes_ckm_repo <- "/Users/krishnasanaka/nhanes_ckm"
  
  path_nhanes_nsb_folder <- "/Users/krishnasanaka/Library/CloudStorage/OneDrive-Emory/NHANES Subtypes Body Composition"
  path_nhanes_nsb_repo <- "/Users/krishnasanaka/nhanes_subtypes_bodycomp"
  
  path_nhanes_ckm_raw <- paste0(path_nhanes_ckm_folder,"/working/raw")
  path_nhanes_ckm_cleaned <- paste0(path_nhanes_ckm_folder,"/working/cleaned")
  path_nhanes_ckm_newdm <- paste0(path_nhanes_ckm_folder,"/working/new diabetes")
  path_nhanes_ckm_variable_list <- paste0(path_nhanes_ckm_repo,"/data/CKM Variable List.xlsx")
  path_nhanes_body_composition <- paste0(path_nhanes_ckm_repo, "/data/nsbdat")
  path_nhanes_nsb_variable_list <- paste0(path_nhanes_ckm_repo, "/data/nsbdat/NSB Variable List.xlsx")
  
  path_nhanes_nsb_raw <- paste0(path_nhanes_nsb_folder,"/working/raw")
  path_nhanes_nsb_cleaned <- paste0(path_nhanes_nsb_folder,"/working/cleaned")
  
}
if(Sys.info()["user"] == "JGUO258"){
  path_nhanes_ckm_folder <- "C:/Users/JGUO258/OneDrive - Emory/Papers/NHANES CKM Cascade"
  path_nhanes_ckm_repo <- "C:/Users/JGUO258/Documents/JGUO/papers repo/nhanes_ckm"
  
  path_nhanes_ckm_raw <- paste0(path_nhanes_ckm_folder,"/working/raw")
  path_nhanes_ckm_cleaned <- paste0(path_nhanes_ckm_folder,"/working/cleaned")
  path_nhanes_ckm_newdm <- paste0(path_nhanes_ckm_folder,"/working/new diabetes")
  path_nhanes_ckm_variable_list <- paste0(path_nhanes_ckm_repo,"/data/CKM Variable List.xlsx")
  
}
if(Sys.info()["user"] == "carolinechizak"){
  # Install the necessary Python packages
  
  # reticulate::use_virtualenv("~/.virtualenvs/r-reticulate", required = TRUE)
  # reticulate::py_install(c("numpy", "pandas", "scikit-learn", "matplotlib", "seaborn", "kneed"), pip = TRUE)
  
  
  path_nhanes_ckm_folder <- "/Users/carolinechizak/Library/CloudStorage/OneDrive-SharedLibraries-Emory/Varghese, Jithin Sam - NHANES Subtypes Mortality"
  path_nhanes_ckm_repo <- "/Users/carolinechizak/Documents/GitHub/nhanes_ckm"
  
  path_nhanes_ckm_raw <- paste0(path_nhanes_ckm_folder,"/working/raw")
  path_nhanes_ckm_cleaned <- paste0(path_nhanes_ckm_folder,"/working/cleaned")
  path_nhanes_ckm_newdm <- paste0(path_nhanes_ckm_folder,"/working/new diabetes")
  path_nhanes_ckm_variable_list <- paste0(path_nhanes_ckm_repo,"/data/CKM Variable List.xlsx")
  
  
  }

cluster_colors_cosmos_all <- c("MOD"="#F8BDA4","SIRD"="#A1C3AC","SIDD"="#ACD9EA","MARD"="#D0ACC9")  

diseases <- c("mortstat",paste0("mortality_",c("heart", "malignant_neoplasms", "any_other")))
disease_labels = c("All Cause","Heart Disease","Cancer","Other")
