new_or_undiagnosed_dm <- readRDS(file = paste0(path_nhanes_ckm_newdm,"/new_or_undiagnosed_dm.rds")) %>% 
  dplyr::filter(!year %in% c("2017Mar2020","2019Mar2020","20212023")) %>% 
  dplyr::select(respondentid,year,interview_period, mec4yweight, mec2yweight) %>% 
  mutate(median_date = case_when(interview_period == 1 ~ paste0(str_sub(year,5,8),"-01-30"),
                                 interview_period == 2 ~ paste0(str_sub(year,5,8),"-07-31"),
                                 TRUE ~ paste0(str_sub(year,5,8),"-04-30"))) %>% 
  mutate(median_date = ymd(median_date)) %>%
  mutate(
    pooled_weight = case_when(
      year %in% c("1999-2000", "2001-2002") ~ mec4yweight / 10,
      TRUE ~ mec2yweight / 10
    ))

# Load in the imputed and clustered data set:
clustered_set <- read_csv(paste0(path_nhanes_ckm_newdm, "/knn clusters.csv"))  %>% 
  distinct(respondentid, .keep_all = TRUE) %>%
  mutate(cluster = as.factor(cluster))

# Ref: https://www.cdc.gov/nchs/data-linkage/mortality-public.htm

# ELIGSTAT--1: the survey participant was eligible for the mortality linkage, 
# 2: the survey participant was under age 18 and not eligible for public release, 
# 3: the survey participant was not linkage eligible due to having insufficient identifying data to conduct data linkage.

# All-cause death -- MORTSTAT: vital status code (0=Assumed alive, 1=Assumed deceased)
# Cause-specific death -- UCOD_LEADING: Underlying Leading Cause of Death: Recode 

# PERMTH_INT: follow-up time calculated using person months from the date of interview to the date of death or the end of the mortality period 

mortality_data <- read_rds(paste0(path_nhanes_ckm_folder,"/working/cleaned/ncdat12_ndi linked mortality data.RDS")) %>%
  rename(respondentid = seqn) %>% 
  dplyr::filter(eligstat == 1) %>% 
  distinct(respondentid, .keep_all = TRUE)

analytic_sample <- left_join(clustered_set,
                             mortality_data %>% dplyr::select(-year),
                             by = c("respondentid")) %>% 
  left_join(new_or_undiagnosed_dm,
            by=c("respondentid","year")) %>% 
  # event status
  mutate(mortality_heart = case_when(ucod_leading == 1 ~ 1,
                                     TRUE ~ 0),
         mortality_malignant_neoplasms = case_when(ucod_leading == 2 ~ 1,
                                                   TRUE ~ 0),
         mortality_chronic_lower_respiratory  = case_when(ucod_leading == 3 ~ 1,
                                                          TRUE ~ 0),
         mortality_accidents = case_when(ucod_leading == 4 ~ 1,
                                         TRUE ~ 0),
         mortality_cerebrovascular = case_when(ucod_leading == 5 ~ 1,
                                               TRUE ~ 0),
         mortality_alzheimer = case_when(ucod_leading == 6 ~ 1,
                                         TRUE ~ 0),
         mortality_diabetes_mellitus = case_when(ucod_leading == 7 ~ 1,
                                                 TRUE ~ 0),
         mortality_influenza_pneumonia  = case_when(ucod_leading == 8 ~ 1,
                                                    TRUE ~ 0),
         mortality_nephrosis = case_when(ucod_leading == 9 ~ 1,
                                         TRUE ~ 0),
         mortality_other = case_when(ucod_leading == 10 ~ 1,
                                     TRUE ~ 0),
         censoring_time = case_when(!is.na(permth_int) ~ permth_int,
                                    permth_int >= 300 ~ as.numeric(difftime(ymd("2019-12-31"),median_date,units="weeks"))/4,
                                    TRUE ~ as.numeric(difftime(ymd("2019-12-31"),median_date,units="weeks"))/4)) %>% 
  dplyr::filter(!is.na(censoring_time)) %>%
  mutate(mortality_any_other = if_else(
    mortstat == 1 & mortality_heart == 0 & mortality_malignant_neoplasms == 0, 
    1, 
    0
  ))
