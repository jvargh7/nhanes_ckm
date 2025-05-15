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
                   "20152016", "20172018","2017Mar2020","20212023")

combined_nhanes <- combine_nhanes(path_nhanes_nsb_folder, years_to_load)

saveRDS(combined_nhanes, file = paste0(path_nhanes_nsb_cleaned,"/combined_nhanes.rds"))