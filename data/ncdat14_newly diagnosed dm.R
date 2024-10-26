rm(list=ls());gc();source(".Rprofile")

library(purrr)
library(readxl)

combine_nhanes <- function(path, years) {
  datasets <- list()
  
  for (year in years) {
    file_path <- paste0(path, "/working/cleaned/nhanes_", year, ".RDS")
    data <- readRDS(file_path) %>%
      mutate(year = year) 
    datasets[[year]] <- data
  }
  
  combined_data <- bind_rows(datasets)
  return(combined_data)
}


years_to_load <- c("19992000", "20012002", "20032004", "20052006", 
                   "20072008", "20092010", "20112012", "20132014", 
                   "20152016", "20172018", "2019Mar2020","20212023")

combined_nhanes <- combine_nhanes(path_nhanes_ckm_folder, years_to_load)

#--------------------------------------------------------------------------------------------------------------------------------------
# adults (age >= 18y)
combined_nhanes_over18 <- combined_nhanes %>%
  dplyr::filter(age >= 18) %>%  
  dplyr::mutate(
    sbp = rowMeans(select(., systolic1, systolic2, systolic3, systolic4), na.rm = TRUE),  # Calculate mean systolic blood pressure
    dbp = rowMeans(select(., diastolic1, diastolic2, diastolic3, diastolic4), na.rm = TRUE),  # Calculate mean diastolic blood pressure
    dm_age = ifelse(dm_age > 100, NA, dm_age)  # Set dm_age > 100 to NA
  )

saveRDS(combined_nhanes_over18, file = paste0(path_nhanes_ckm_newdm,"/combined_nhanes_over18.rds"))

#--------------------------------------------------------------------------------------------------------------------------------------
# Filtering data frames to only include newly diagnosed diabetes or undiagnosed diabetes. 
# Undiagnosed diabetes determined by the ADA 2024 Guidelines. ADA 2024 guidelines state that A1C (glycohemoglobin) ≥6.5% (≥48 mmol/mol), 
# fasting plasma glucose ≥126 mg/dL (≥7.0 mmol/L), or 2-h PG ≥200 mg/dL (≥11.1 mmol/L) during OGTT can qualify as a diabetes diagnosis:

new_or_undiagnosed_dm <- combined_nhanes_over18 %>%
  group_by(respondentid) %>% 
  dplyr::filter(
    (dm_doc_told == 1 & age >= dm_age & age - dm_age <= 1 & !is.na(dm_age) & !is.na(age)) | 
      (dm_doc_told == 2 & (glycohemoglobin >= 6.5 | fasting_glucose >= 126))
    ) %>% 
  ungroup() 

saveRDS(new_or_undiagnosed_dm, file = paste0(path_nhanes_ckm_newdm,"/new_or_undiagnosed_dm.rds"))

#--------------------------------------------------------------------------------------------------------------------------------------
# exclude missing BMI and HbA1c for new or undiagnosed
nhanes_with_vars <- new_or_undiagnosed_dm %>%
  dplyr::filter(!is.na(bmi) & !is.na(glycohemoglobin))

saveRDS(nhanes_with_vars, file = paste0(path_nhanes_ckm_newdm,"/nhanes_with_vars.rds"))
  
# keep those with missing BMI and HbA1c for new or undiagnosed
# nhanes_without_vars <- new_or_undiagnosed_dm %>%
#   dplyr::filter(
#     is.na(bmi) | is.na(glycohemoglobin)
#   )

nhanes_without_vars <- new_or_undiagnosed_dm %>%
  dplyr::filter(!respondentid %in% nhanes_with_vars$respondentid)

saveRDS(nhanes_without_vars, file = paste0(path_nhanes_ckm_newdm,"/nhanes_without_vars.rds"))

#--------------------------------------------------------------------------------------------------------------------------------------
# add HOMA2 indices
load_homa2_data <- function(path, sheets) {
  datasets <- list()
  
  for (sheet in sheets) {
    data <- read_excel(paste0(path, "/HOMA2 indices calculation/homa2 indices values.xlsx"),
                       sheet = sheet) 
    datasets[[sheet]] <- data
  }
  
  combined_data <- bind_rows(datasets)
  return(combined_data)
}

years_sheets <- c("19992000", "20012002", "20032004", "20052006", "20072008", 
                  "20092010", "20112012", "20132014", "20152016", "20172018", 
                  "2019Mar2020","20212023")

homa2_data <- load_homa2_data(path_nhanes_ckm_cleaned, years_sheets)

newdm_data <- nhanes_with_vars %>% 
  left_join(homa2_data %>% 
              dplyr::select(respondentid, year, `HOMA2 %B`, `HOMA2 IR`), 
            by = c("respondentid", "year")) %>% 
  rename(egfr = eGFR,
         homa2b = `HOMA2 %B`,
         homa2ir = `HOMA2 IR`)

newdm_data %>% 
saveRDS(., file = paste0(path_nhanes_ckm_newdm,"/newdm_data.rds"))

newdm_data %>% 
write.csv(., file = paste0(path_nhanes_ckm_newdm, "/newdm_data.csv"), row.names = FALSE)

