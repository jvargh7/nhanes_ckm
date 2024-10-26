rm(list=ls());gc();source(".Rprofile")

# fasting glucose: mg/dL; insulin_level: µU/mL

library(purrr)
library(readr)
library(writexl)

dataset_years <- c("19992000", "20012002", "20032004", "20052006", "20072008", "20092010", "20112012", 
                   "20132014", "20152016", "20172018", "2019Mar2020","20212023")


process_nhanes_data <- function(year) {
  file_path <- paste0(path_nhanes_ckm_cleaned, "/nhanes_", year, ".rds")
  data <- readRDS(file_path) %>%
    dplyr::select(respondentid, fasting_glucose, insulin_level) %>%
    dplyr::filter(!is.na(fasting_glucose), !is.na(insulin_level)) %>% 
    group_by(respondentid) %>%
    mutate(
      glucosef_mmol_l = fasting_glucose / 18,
      insulinf_µU_ml = insulin_level * 6,
      glucosef_mmol_l = case_when(
        glucosef_mmol_l < 3 ~ 3,
        glucosef_mmol_l > 25 ~ 25,
        TRUE ~ glucosef_mmol_l
      ),
      insulinf_µU_ml = case_when(
        insulinf_µU_ml < 20 ~ 20,
        insulinf_µU_ml > 400 ~ 400,
        TRUE ~ insulinf_µU_ml
      )
    ) %>%
    ungroup() %>%
    mutate(year = year)
  return(data)
}

# Process each dataset and store the data frames in a list
list_of_dataframes <- setNames(map(dataset_years, process_nhanes_data), dataset_years)

# Save all data frames to separate sheets in the same Excel file
excel_path <- paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices_converting units.xlsx")
write_xlsx(list_of_dataframes, excel_path)



