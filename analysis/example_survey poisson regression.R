rm(list=ls());gc();source(".Rprofile")
# The above steps load the survey and srvyr packages

options(scipen = 999) # To get it in decimals rather than in the ^10 format

# .RDS is a file storage format in R --> you can read a .csv file using read_csv/read.csv etc instead
# The below can be any NHANES dataset you have cleaned and have access to 
nhanes_2017Mar2020 <- readRDS(paste0(path_nhanes_ckm_folder,"/working/cleaned/nhanes_2017Mar2020.RDS")) %>% 
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
                                                     "Other Race - Including Multi-Racial")))


nhanes_2017Mar2020_svyobj = nhanes_2017Mar2020 %>% 
  as_survey_design(.data=.,
                   ids=psu,
                   strata = pseudostratum,
                   weights = mecweight, # Specify the weight variable here
                   nest = TRUE,
                   # Both the below work well for most cases
                   pps = "brewer",variance = "YG") %>% 
  srvyr::filter(bmi_category != "Missing")

# Does a complete case analysis -- 
model = svyglm(toldhighbp ~ serum_glucose + bmi_category + race,design = nhanes_2017Mar2020_svyobj,family=quasipoisson()) 

coefs = model %>% 
  broom::tidy()

# If you need to impute missing values of toldhighbp, bmi_category and race, 
# you will need to run the imputation first, and then create a survey design object for each imputed dataset
# Example here for another dataset from India:
# 1. Multiple imputation: https://github.com/jvargh7/nfhs5_couples/blob/main/preprocessing/n5cpre03_svymi.R
# 2. Survey regression: https://github.com/jvargh7/nfhs5_couples/blob/main/analysis/n5cm01_htn%20poisson%20regression%20with%20multiple%20imputation.R