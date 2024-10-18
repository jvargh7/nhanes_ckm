rm(list=ls());gc();source(".Rprofile")

library(purrr)
library(readxl)

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

# Binding all the data for later analysis:
combined_nhanes_over18 <- bind_rows(nhanes_19992000, nhanes_20012002, nhanes_20032004, nhanes_20052006,
                                    nhanes_20072008, nhanes_20092010, nhanes_20112012, nhanes_20132014,
                                    nhanes_20152016, nhanes_20172018, nhanes_2017Mar2020)

# Filter data frame as necessary:
combined_nhanes_over18 <- combined_nhanes_over18 %>%
  dplyr::filter(age >= 18) %>%  # Filter out individuals who are younger than 18
  dplyr::mutate(
    sbp = rowMeans(select(., systolic1, systolic2, systolic3, systolic4), na.rm = TRUE),  # Calculate mean systolic blood pressure
    dbp = rowMeans(select(., diastolic1, diastolic2, diastolic3, diastolic4), na.rm = TRUE),  # Calculate mean diastolic blood pressure
    dm_age = ifelse(dm_age > 100, NA, dm_age)  # Set dm_age > 100 to NA
  )

# Save the data frame:
saveRDS(combined_nhanes_over18, file = paste0(path_nhanes_ckm_newdm,"/combined_nhanes_over18.rds"))

# Filtering data frames to only include newly diagnosed diabetes or undiagnosed diabetes. Undiagnosed diabetes determined by the ADA 2024 Guidelines. ADA 2024 guidelines state that A1C (glycohemoglobin) ≥6.5% (≥48 mmol/mol), fasting plasma glucose ≥126 mg/dL (≥7.0 mmol/L), or 2-h PG ≥200 mg/dL (≥11.1 mmol/L) during OGTT can qualify as a diabetes diagnosis:
filter_function <- function(data) {
  filtered_data <- data %>%
    # Filter rows where either condition is TRUE
    dplyr::filter(
      (age - dm_age <= 1 & !is.na(dm_age)) | 
        (dm_doc_told == 2 & (glycohemoglobin >= 6.5 | fasting_glucose >= 126))
    )
  
  return(filtered_data)
}
  
newdm_nhanes_19992000 <- filter_function(nhanes_19992000)

newdm_nhanes_20012002 <- filter_function(nhanes_20012002)

newdm_nhanes_20032004 <- filter_function(nhanes_20032004)

newdm_nhanes_20052006 <- filter_function(nhanes_20052006)

newdm_nhanes_20072008 <- filter_function(nhanes_20072008)

newdm_nhanes_20092010 <- filter_function(nhanes_20092010)

newdm_nhanes_20112012 <- filter_function(nhanes_20112012)

newdm_nhanes_20132014 <- filter_function(nhanes_20132014)

newdm_nhanes_20152016 <- filter_function(nhanes_20152016)

newdm_nhanes_20172018 <- filter_function(nhanes_20172018)

newdm_nhanes_2017Mar2020 <- filter_function(nhanes_2017Mar2020)

# Binding all the data for later analysis:
new_or_undiagnosed_dm <- bind_rows(newdm_nhanes_19992000, newdm_nhanes_20012002, newdm_nhanes_20032004, newdm_nhanes_20052006,
                                    newdm_nhanes_20072008, newdm_nhanes_20092010, newdm_nhanes_20112012, newdm_nhanes_20132014,
                                    newdm_nhanes_20152016, newdm_nhanes_20172018, newdm_nhanes_2017Mar2020)

# # Filter data frame as necessary:
new_or_undiagnosed_dm <- new_or_undiagnosed_dm %>%
  dplyr::filter(age >= 18) %>%  # Filter out individuals who are younger than 18
  dplyr::mutate(
    sbp = rowMeans(select(., systolic1, systolic2, systolic3, systolic4), na.rm = TRUE),  # Calculate mean systolic blood pressure
    dbp = rowMeans(select(., diastolic1, diastolic2, diastolic3, diastolic4), na.rm = TRUE),  # Calculate mean diastolic blood pressure
    dm_age = ifelse(dm_age > 100, NA, dm_age)  # Set dm_age > 100 to NA
  )

# Save the data frame:
saveRDS(new_or_undiagnosed_dm, file = paste0(path_nhanes_ckm_newdm,"/new_or_undiagnosed_dm.rds"))

# Creating formulas for filtering data frames to make sure there are no N/A values for bmi and glycohemoglobin:
filtering_vars <- function(data) {
  filtered_data <- data %>%
    dplyr::filter(
      !is.na(bmi) & !is.na(glycohemoglobin)
    )
  # Return the filtered dataset
  return(filtered_data)
}

# Applying these new filtering formulas:
newdm_nhanes_19992000_vars <- filtering_vars(newdm_nhanes_19992000)

newdm_nhanes_20012002_vars <- filtering_vars(newdm_nhanes_20012002)

newdm_nhanes_20032004_vars <- filtering_vars(newdm_nhanes_20032004)

newdm_nhanes_20052006_vars <- filtering_vars(newdm_nhanes_20052006)

newdm_nhanes_20072008_vars <- filtering_vars(newdm_nhanes_20072008)

newdm_nhanes_20092010_vars <- filtering_vars(newdm_nhanes_20092010)

newdm_nhanes_20112012_vars <- filtering_vars(newdm_nhanes_20112012)

newdm_nhanes_20132014_vars <- filtering_vars(newdm_nhanes_20132014)

newdm_nhanes_20152016_vars <- filtering_vars(newdm_nhanes_20152016)

newdm_nhanes_20172018_vars <- filtering_vars(newdm_nhanes_20172018)

newdm_nhanes_2017Mar2020_vars <- filtering_vars(newdm_nhanes_2017Mar2020)

# Binding all the data for later analysis:
nhanes_with_vars <- bind_rows(newdm_nhanes_19992000_vars, newdm_nhanes_20012002_vars, newdm_nhanes_20032004_vars, newdm_nhanes_20052006_vars,
                                   newdm_nhanes_20072008_vars, newdm_nhanes_20092010_vars, newdm_nhanes_20112012_vars, newdm_nhanes_20132014_vars,
                                   newdm_nhanes_20152016_vars, newdm_nhanes_20172018_vars, newdm_nhanes_2017Mar2020_vars)

# Filter data frame as necessary:
nhanes_with_vars <- nhanes_with_vars %>%
  dplyr::filter(age >= 18) %>%  # Filter out individuals who are younger than 18
  dplyr::mutate(
    sbp = rowMeans(select(., systolic1, systolic2, systolic3, systolic4), na.rm = TRUE),  # Calculate mean systolic blood pressure
    dbp = rowMeans(select(., diastolic1, diastolic2, diastolic3, diastolic4), na.rm = TRUE),  # Calculate mean diastolic blood pressure
    dm_age = ifelse(dm_age > 100, NA, dm_age)  # Set dm_age > 100 to NA
  )

# Save the data frame:
saveRDS(nhanes_with_vars, file = paste0(path_nhanes_ckm_newdm,"/nhanes_with_vars.rds"))

# Function for only keeping those with N/A values:
filtering_novars <- function(data) {
  filtered_data <- data %>%
    dplyr::filter(
      is.na(bmi) & is.na(glycohemoglobin)
    )
  # Return the filtered dataset
  return(filtered_data)
}

# Applying these new filtering formulas:
newdm_nhanes_19992000_novars <- filtering_novars(newdm_nhanes_19992000)

newdm_nhanes_20012002_novars <- filtering_novars(newdm_nhanes_20012002)

newdm_nhanes_20032004_novars <- filtering_novars(newdm_nhanes_20032004)

newdm_nhanes_20052006_novars <- filtering_novars(newdm_nhanes_20052006)

newdm_nhanes_20072008_novars <- filtering_novars(newdm_nhanes_20072008)

newdm_nhanes_20092010_novars <- filtering_novars(newdm_nhanes_20092010)

newdm_nhanes_20112012_novars <- filtering_novars(newdm_nhanes_20112012)

newdm_nhanes_20132014_novars <- filtering_novars(newdm_nhanes_20132014)

newdm_nhanes_20152016_novars <- filtering_novars(newdm_nhanes_20152016)

newdm_nhanes_20172018_novars <- filtering_novars(newdm_nhanes_20172018)

newdm_nhanes_2017Mar2020_novars <- filtering_novars(newdm_nhanes_2017Mar2020)

# Binding all the data for later analysis:
nhanes_without_vars <- bind_rows(newdm_nhanes_19992000_novars, newdm_nhanes_20012002_novars, newdm_nhanes_20032004_novars, newdm_nhanes_20052006_novars,
                              newdm_nhanes_20072008_novars, newdm_nhanes_20092010_novars, newdm_nhanes_20112012_novars, newdm_nhanes_20132014_novars,
                              newdm_nhanes_20152016_novars, newdm_nhanes_20172018_novars, newdm_nhanes_2017Mar2020_novars)

# Filter data frame as necessary:
nhanes_without_vars <- nhanes_without_vars %>%
  dplyr::filter(age >= 18) %>%  # Filter out individuals who are younger than 18
  dplyr::mutate(
    sbp = rowMeans(select(., systolic1, systolic2, systolic3, systolic4), na.rm = TRUE),  # Calculate mean systolic blood pressure
    dbp = rowMeans(select(., diastolic1, diastolic2, diastolic3, diastolic4), na.rm = TRUE),  # Calculate mean diastolic blood pressure
    dm_age = ifelse(dm_age > 100, NA, dm_age)  # Set dm_age > 100 to NA
  )

# Save the data frame:
saveRDS(nhanes_without_vars, file = paste0(path_nhanes_ckm_newdm,"/nhanes_without_vars.rds"))

# Loading in the HOMA2 indices data sets:
homa19992000 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="19992000") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

homa20012002 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="20012002") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

homa20032004 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="20032004") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

homa20052006 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="20052006") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

homa20072008 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="20072008") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

homa20092010 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="20092010") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

homa20112012 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="20112012") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

homa20132014 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="20132014") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

homa20152016 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="20152016") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

homa20172018 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="20172018") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

homa2017Mar2020 <- readxl::read_excel(paste0(path_nhanes_ckm_cleaned, "/HOMA2 indices calculation/homa2 indices values.xlsx"), sheet="2017Mar2020") %>%
  select(respondentid, `HOMA2 %B`, `HOMA2 %S`, `HOMA2 IR`)

# Merging the homa data sets with the main ones:
newdm_nhanes_19992000_homa <- newdm_nhanes_19992000_vars %>%
  left_join(homa19992000, by = "respondentid")

newdm_nhanes_20012002_homa <- newdm_nhanes_20012002_vars %>%
  left_join(homa20012002, by = "respondentid")

newdm_nhanes_20032004_homa <- newdm_nhanes_20032004_vars %>%
  left_join(homa20032004, by = "respondentid")

newdm_nhanes_20052006_homa <- newdm_nhanes_20052006_vars %>%
  left_join(homa20052006, by = "respondentid")

newdm_nhanes_20072008_homa <- newdm_nhanes_20072008_vars %>%
  left_join(homa20072008, by = "respondentid")

newdm_nhanes_20092010_homa <- newdm_nhanes_20092010_vars %>%
  left_join(homa20092010, by = "respondentid")

newdm_nhanes_20112012_homa <- newdm_nhanes_20112012_vars %>%
  left_join(homa20112012, by = "respondentid")

newdm_nhanes_20132014_homa <- newdm_nhanes_20132014_vars %>%
  left_join(homa20132014, by = "respondentid")

newdm_nhanes_20152016_homa <- newdm_nhanes_20152016_vars %>%
  left_join(homa19992000, by = "respondentid")

newdm_nhanes_20172018_homa <- newdm_nhanes_20172018_vars %>%
  left_join(homa20172018, by = "respondentid")

newdm_nhanes_2017Mar2020_homa <- newdm_nhanes_2017Mar2020_vars %>%
  left_join(homa2017Mar2020, by = "respondentid")

# Saving the data sets:
saveRDS(newdm_nhanes_19992000_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_19992000.rds"))

saveRDS(newdm_nhanes_20012002_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20012002.rds"))

saveRDS(newdm_nhanes_20032004_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20032004.rds"))

saveRDS(newdm_nhanes_20052006_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20052006.rds"))

saveRDS(newdm_nhanes_20072008_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20072008.rds"))

saveRDS(newdm_nhanes_20092010_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20092010.rds"))

saveRDS(newdm_nhanes_20112012_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20112012.rds"))

saveRDS(newdm_nhanes_20132014_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20132014.rds"))

saveRDS(newdm_nhanes_20152016_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20152016.rds"))

saveRDS(newdm_nhanes_20172018_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_20172018.rds"))

saveRDS(newdm_nhanes_2017Mar2020_homa, file = paste0(path_nhanes_ckm_newdm,"/newdm_nhanes_2017Mar2020.rds"))

# Also, adding all the data frames together for analysis:
dataframes <- list(newdm_nhanes_19992000_homa, newdm_nhanes_20012002_homa, newdm_nhanes_20032004_homa,
                   newdm_nhanes_20052006_homa, newdm_nhanes_20072008_homa, newdm_nhanes_20092010_homa,
                   newdm_nhanes_20112012_homa, newdm_nhanes_20132014_homa, newdm_nhanes_20152016_homa,
                   newdm_nhanes_20172018_homa, newdm_nhanes_2017Mar2020_homa)

years <- c("1999-2000", "2001-2002", "2003-2004", "2005-2006", "2007-2008", 
           "2009-2010", "2011-2012", "2013-2014", "2015-2016", "2017-2018", "2017-Mar2020")

newdm_data <- map2_dfr(dataframes, years, ~ mutate(.x, year = .y))

# Adding combined sbp and dbp variables, and setting dm_age > 100 to NA
newdm_data <- newdm_data %>%
  dplyr::filter(age >= 18) %>%  # Filter out individuals who are younger than 18
  dplyr::mutate(
    sbp = rowMeans(select(., systolic1, systolic2, systolic3, systolic4), na.rm = TRUE),
    dbp = rowMeans(select(., diastolic1, diastolic2, diastolic3, diastolic4), na.rm = TRUE),
    dm_age = ifelse(dm_age > 100, NA, dm_age)  # Set dm_age > 100 to NA
  )

# Saving the data frame:
saveRDS(newdm_data, file = paste0(path_nhanes_ckm_newdm,"/newdm_data.rds"))

write.csv(newdm_data, file = paste0(path_nhanes_ckm_newdm, "/newdm_data.csv"), row.names = FALSE)

