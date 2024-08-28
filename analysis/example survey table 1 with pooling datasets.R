rm(list=ls());gc();source(".Rprofile")
# The above steps load the survey and srvyr packages

# The below can be any NHANES dataset you have cleaned and have access to 
# .RDS is a file storage format in R --> you can read a .csv file using read_csv/read.csv etc instead
nhanes_2015Mar2020 <- bind_rows(readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_20152016.RDS")) %>% 
                             mutate(wave = "2015-2016"),
                                readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_2017Mar2020.RDS")) %>% 
                             mutate(wave = "2017-2020")) %>% 
  mutate(toldhighbp = case_when(toldhighbp == 1 ~ 1,
                                toldhighbp == 2 ~ 0,
                                TRUE ~ NA_real_),
         bmi_category = case_when(bmi < 18.5 ~ "Underweight",
                                  bmi < 25.0 ~ "Normal",
                                  bmi < 30.0 ~ "Overweight",
                                  bmi >= 30.0 ~ "Obesity",
                                  TRUE ~ "Missing"),
         race = factor(race,levels=c(1:5,7),labels=c("Mexican American",
                                                     "Other Hispanic",
                                                     "Non-Hispanic White",
                                                     "Non-Hispanic Black",
                                                     "Non-Hispanic Asian",
                                                     "Other Race - Including Multi-Racial"))) %>% 
  # Refer: https://www.cdc.gov/nchs/data/series/sr_02/sr02-190.pdf >> Page 20 onwards
  mutate(normalizedmecweight = case_when(wave == "2015-2016" ~ mecweight*(2/5.2),
                                         wave == "2017-2020" ~ mecweight*(3.2/5.2)))

nhanes_2015Mar2020_svyobj = nhanes_2015Mar2020 %>% 
  as_survey_design(.data=.,
                   ids=psu,
                   strata = pseudostratum,
                   weights = normalizedmecweight, # Specify the weight variable here
                   nest = TRUE,
                   # Both the below work well for most cases
                   pps = "brewer",variance = "YG")


library(gtsummary)
nhanes_2015Mar2020_svyobj %>% 
  tbl_svysummary(
    by = wave,
    missing_text = "Missing",
    include = c(height,serum_glucose,
                toldhighbp,race,bmi_category
    ),
    type = list(height ~ "continuous2",
                serum_glucose ~ "continuous2",
                toldhighbp ~ "dichotomous",
                race ~ "categorical",
                bmi_category ~ "categorical"
    ), 
    statistic = list(serum_glucose ~ c("{mean} ({sd})","{N_miss_unweighted}"),
                     all_categorical() ~ "{p}%",
                     all_dichotomous() ~ "{p}%",
                     height ~ c("{median} ({p25}, {p75})","{N_nonmiss_unweighted}"))
  ) %>% 
  add_n(statistic =  "{N_obs_unweighted}") %>% # See add_n.tbl_summary for more details
  add_overall() %>%
  as_gt() %>%
  gt::gtsave(filename = "analysis/example_survey table 1 with pooling data.docx")
