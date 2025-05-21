rm(list=ls());gc();source(".Rprofile")

library(purrr)
library(readxl)

combined_nhanes_over18 <- readRDS(paste0(path_nhanes_ckm_newdm,"/combined_nhanes_over18.rds"))

#--------------------------------------------------------------------------------------------------------------------------------------
# Filtering data frames to only include newly diagnosed diabetes or undiagnosed diabetes. 
# Undiagnosed diabetes determined by the ADA 2024 Guidelines. ADA 2024 guidelines state that A1C (glycohemoglobin) ≥6.5% (≥48 mmol/mol), 
# fasting plasma glucose ≥126 mg/dL (≥7.0 mmol/L), or 2-h PG ≥200 mg/dL (≥11.1 mmol/L) during OGTT can qualify as a diabetes diagnosis:

all_dm <- combined_nhanes_over18 %>%
  group_by(respondentid) %>% 
  dplyr::filter(
    (dm_doc_told == 1 & age >= dm_age & !is.na(dm_age) & !is.na(age)) | 
      (dm_doc_told == 2 & (glycohemoglobin >= 6.5 | fasting_glucose >= 126))
    ) %>% 
  ungroup() %>% 
  # There are no cases where dm_age > age
  mutate(dm_age = case_when(is.na(dm_age) ~ age,
                            TRUE ~ dm_age)) %>% 
  mutate(duration = age - dm_age)

saveRDS(all_dm, file = paste0(path_nhanes_ckm_alldm,"/ncsen14_all dm.rds"))

#--------------------------------------------------------------------------------------------------------------------------------------
# exclude missing BMI and HbA1c for new or undiagnosed
nhanes_with_vars <- all_dm %>%
  dplyr::filter(!is.na(bmi) & !is.na(glycohemoglobin))

saveRDS(nhanes_with_vars, file = paste0(path_nhanes_ckm_alldm,"/ncsen14_nhanes_with_vars.rds"))
  
# keep those with missing BMI and HbA1c for new or undiagnosed
# nhanes_without_vars <- new_or_undiagnosed_dm %>%
#   dplyr::filter(
#     is.na(bmi) | is.na(glycohemoglobin)
#   )

nhanes_without_vars <- all_dm %>%
  dplyr::filter(!respondentid %in% nhanes_with_vars$respondentid)

saveRDS(nhanes_without_vars, file = paste0(path_nhanes_ckm_alldm,"/ncsen14_nhanes_without_vars.rds"))

#--------------------------------------------------------------------------------------------------------------------------------------
# add HOMA2 indices and removing implausible values:
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

alldm_data <- nhanes_with_vars %>% 
  left_join(homa2_data %>% 
              dplyr::select(respondentid, year, `HOMA2 %B`, `HOMA2 IR`), 
            by = c("respondentid", "year")) %>% 
  rename(egfr = eGFR,
         homa2b = `HOMA2 %B`,
         homa2ir = `HOMA2 IR`)

# Filtering data frame to only include plausible variable values according to: https://doi.org/10.1038/s44161-023-00391-y
plausible_ranges <- list(
  bmi = c(10, 80),                 # kg/m^2
  waistcircumference = c(30, 200), # cm
  fat_percentage = c(2, 60),       # %
  sbp = c(70, 270),                # mmHg
  dbp = c(30, 150),                # mmHg
  triglyceride = c(10, 2000),      # mg/dL
  ldl = c(20, 400),                # mg/dL
  hdl = c(10, 150),                # mg/dL
  glycohemoglobin = c(3, 18),      # %
  fasting_glucose = c(30, 600),    # mg/dL
  serum_creatinine = c(0.1, 15),   # umol/L
  egfr = c(5, 250),                # mL/min/1.73m^2
  alt = c(0, 1000),                # mg/dL
  ast = c(0, 1000)                 # mg/dL
)

# Function to check plausible ranges
check_ranges <- function(data, ranges) {
  # Create an empty list to store results
  out_of_range <- list()
  
  # Iterate over each range in the list
  for (var in names(ranges)) {
    # Check if the variable exists in the data frame
    if (!var %in% colnames(data)) {
      warning(paste("Variable", var, "not found in the data frame."))
      next
    }
    
    # Extract the range for the current variable
    range <- ranges[[var]]
    lower <- range[1]
    upper <- range[2]
    
    # Identify rows with out-of-range values
    out_of_bounds <- which(data[[var]] < lower | data[[var]] > upper)
    
    # If there are out-of-range values, store them
    if (length(out_of_bounds) > 0) {
      out_of_range[[var]] <- data[out_of_bounds, var, drop = FALSE]
    }
  }
  
  # Return the out-of-range results
  if (length(out_of_range) == 0) {
    message("All values are within the plausible ranges.")
    return(NULL)
  } else {
    return(out_of_range)
  }
}

# Usage:
out_of_range_values <- check_ranges(alldm_data, plausible_ranges)

# Print results:
if (!is.null(out_of_range_values)) {
  print(out_of_range_values)
}

# Filter the data frame to exclude 
alldm_data_cleaned <- alldm_data %>%
  # Apply plausible ranges
  mutate(across(
    names(plausible_ranges),
    ~ ifelse(. < plausible_ranges[[cur_column()]][1] | . > plausible_ranges[[cur_column()]][2], NA, .),
    .names = "{.col}"
  )) %>%
  # Ensure SBP > DBP or set both to NA
  mutate(
    sbp = ifelse(sbp <= dbp, NA, sbp),
    dbp = ifelse(sbp <= dbp, NA, dbp)
  ) %>%
  # Ensure triglycerides >  or set both to NA
  mutate(
    triglyceride = ifelse(triglyceride <= hdl, NA, triglyceride),
    hdl = ifelse(triglyceride <= hdl, NA, hdl)
  ) %>% 
  # ADDED FOR ALL DM
  mutate(rx_insulin = case_when(dm_insulin_taking == 1 ~ 1,
                                TRUE ~ 0),
         rx_otherdm = case_when(dm_bloodsugar_taking == 1 ~ 1,
                                TRUE ~ 0),
         rx_chol = case_when(chol_med_taking == 1 ~ 1,
                               TRUE ~ 0),
         rx_htn = case_when(htn_med_taking == 1 ~ 1,
                            TRUE ~ 0)) %>% 
  mutate(include = case_when(is.na(homa2b) & is.na(homa2ir) ~ 1,
                             homa2b >= 350 ~ 2,
                             homa2ir >= 20 ~ 3,
                             TRUE ~ 0))
  


# Save data frames:
alldm_data_cleaned %>%
  dplyr::filter(include %in% c(0,1)) %>% 
  saveRDS(., file = paste0(path_nhanes_ckm_alldm,"/ncsen14_alldm_data.rds"))

alldm_data_cleaned %>%
  dplyr::filter(include %in% c(0,1)) %>%  
  write.csv(., file = paste0(path_nhanes_ckm_alldm, "/ncsen14_alldm_data.csv"), row.names = FALSE)
