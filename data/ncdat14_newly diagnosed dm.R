rm(list=ls());gc();source(".Rprofile")

# Load in the data sets:
nhanes_19992000 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_19992000.RDS"))

nhanes_20012002 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_20012002.RDS"))

nhanes_20032004 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_20032004.RDS"))

nhanes_20052006 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_20052006.RDS"))

nhanes_20072008 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_20072008.RDS"))

nhanes_20092010 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_20092010.RDS"))

nhanes_20112012 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_20112012.RDS"))

nhanes_20132014 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_20132014.RDS"))

nhanes_20152016 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_20152016.RDS"))

nhanes_20172018 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_20172018.RDS"))

nhanes_2017Mar2020 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_2017Mar2020.RDS"))

# Creating a formula to create a variable for whether the diabetes has been diagnosed within a year:
add_recent_diabetes_diagnosis <- function(data) {
  data$dm1year <- (data$age - data$dm_age) <= 1
  return(data)
}

# Applying the formula:
nhanes_19992000 <- add_recent_diabetes_diagnosis(nhanes_19992000)

nhanes_20012002 <- add_recent_diabetes_diagnosis(nhanes_20012002)

nhanes_20032004 <- add_recent_diabetes_diagnosis(nhanes_20032004)

nhanes_20052006 <- add_recent_diabetes_diagnosis(nhanes_20052006)

nhanes_20072008 <- add_recent_diabetes_diagnosis(nhanes_20072008)

nhanes_20092010 <- add_recent_diabetes_diagnosis(nhanes_20092010)

nhanes_20112012 <- add_recent_diabetes_diagnosis(nhanes_20112012)

nhanes_20132014 <- add_recent_diabetes_diagnosis(nhanes_20132014)

nhanes_20152016 <- add_recent_diabetes_diagnosis(nhanes_20152016)

nhanes_20172018 <- add_recent_diabetes_diagnosis(nhanes_20172018)

nhanes_2017Mar2020 <- add_recent_diabetes_diagnosis(nhanes_2017Mar2020)

# ADA 2024 guidelines state that A1C ≥6.5% (≥48 mmol/mol), fasting plasma glucose ≥126 mg/dL (≥7.0 mmol/L), or 2-h PG ≥200 mg/dL (≥11.1 mmol/L) during OGTT can qualify as a diabetes diagnosis:
filter_newdm <- function(data) {
  # Filter the data based on the given conditions and check for column existence
  filtered_data <- data %>%
    dplyr::filter(
      (if ("dm1year" %in% names(data)) data$dm1year == TRUE else FALSE) |
        (if ("glycohemoglobin" %in% names(data)) data$glycohemoglobin >= 6.5 else FALSE) |
        (if ("a1c" %in% names(data)) data$a1c >= 6.5 & data$a1c < 500 else FALSE) |
        (if ("fasting_glucose" %in% names(data)) data$fasting_glucose >= 126 else FALSE) |
        (if ("glucose2h" %in% names(data)) data$glucose2h >= 200 else FALSE)
    )
  
  # Return the filtered dataset
  return(filtered_data)
}

# Applying the formula:
newdm_nhanes_19992000 <- filter_newdm(nhanes_19992000)

newdm_nhanes_20012002 <- filter_newdm(nhanes_20012002)

newdm_nhanes_20032004 <- filter_newdm(nhanes_20032004)

newdm_nhanes_20052006 <- filter_newdm(nhanes_20052006)

newdm_nhanes_20072008 <- filter_newdm(nhanes_20072008)

newdm_nhanes_20092010 <- filter_newdm(nhanes_20092010)

newdm_nhanes_20112012 <- filter_newdm(nhanes_20112012)

newdm_nhanes_20132014 <- filter_newdm(nhanes_20132014)

newdm_nhanes_20152016 <- filter_newdm(nhanes_20152016)

newdm_nhanes_20172018 <- filter_newdm(nhanes_20172018)

newdm_nhanes_2017Mar2020 <- filter_newdm(nhanes_2017Mar2020)

# Creating formulas for filtering equations based on which data sets have which variables:
filtering1 <- function(data) {
  filtered_data <- data %>%
    dplyr::filter(
      !is.na(bmi) & !is.na(glycohemoglobin)
    )
  # Return the filtered dataset
  return(filtered_data)
}

filtering2 <- function(data) {
  filtered_data <- data %>%
    dplyr::filter(
      !is.na(bmi) & !is.na(a1c)
    )
  # Return the filtered dataset
  return(filtered_data)
}

# Applying these new filtering formulas:
newdm_nhanes_19992000 <- filtering1(newdm_nhanes_19992000)

newdm_nhanes_20012002 <- filtering1(newdm_nhanes_20012002)

newdm_nhanes_20032004 <- filtering1(newdm_nhanes_20032004)

newdm_nhanes_20052006 <- filtering2(newdm_nhanes_20052006)

newdm_nhanes_20072008 <- filtering2(newdm_nhanes_20072008)

newdm_nhanes_20092010 <- filtering1(newdm_nhanes_20092010)

newdm_nhanes_20112012 <- filtering2(newdm_nhanes_20112012)

newdm_nhanes_20132014 <- filtering2(newdm_nhanes_20132014)

newdm_nhanes_20152016 <- filtering2(newdm_nhanes_20152016)

newdm_nhanes_20172018 <- filtering2(newdm_nhanes_20172018)

newdm_nhanes_2017Mar2020 <- filtering2(newdm_nhanes_2017Mar2020)

# Saving the data sets:
saveRDS(newdm_nhanes_19992000, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_19992000.rds"))

saveRDS(newdm_nhanes_20012002, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20012002.rds"))

saveRDS(newdm_nhanes_20032004, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20032004.rds"))

saveRDS(newdm_nhanes_20052006, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20052006.rds"))

saveRDS(newdm_nhanes_20072008, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20072008.rds"))

saveRDS(newdm_nhanes_20092010, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20092010.rds"))

saveRDS(newdm_nhanes_20112012, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20112012.rds"))

saveRDS(newdm_nhanes_20132014, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20132014.rds"))

saveRDS(newdm_nhanes_20152016, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20152016.rds"))

saveRDS(newdm_nhanes_20172018, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20172018.rds"))

saveRDS(newdm_nhanes_2017Mar2020, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_2017Mar2020.rds"))

