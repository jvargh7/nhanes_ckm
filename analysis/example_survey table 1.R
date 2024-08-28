rm(list=ls());gc();source(".Rprofile")
# The above steps load the survey and srvyr packages

# The below can be any NHANES dataset you have cleaned and have access to 
# .RDS is a file storage format in R --> you can read a .csv file using read_csv/read.csv etc instead
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
                                                   "Other Race - Including Multi-Racial"))) %>% 
  mutate(normalizedmecweight = mecweight*n()/sum(mecweight,na.rm=TRUE))
# MEC: Mobile Examination Center
# For cross-sectional analysis of biomarkers, use the MEC weights 
# For cross-sectional analysis of questionnaire, use the interview weights
# Always use the lowest common denominator to select the right weights
# If pooling, there are specific guidelines around how to combine weights


nhanes_2017Mar2020_svyobj = nhanes_2017Mar2020 %>% 
  as_survey_design(.data=.,
                   ids=psu,
                   strata = pseudostratum,
                   weights = mecweight, # Specify the weight variable here
                   nest = TRUE,
                   # Both the below work well for most cases
                   pps = "brewer",variance = "YG")


# I would recommend using tbl_svysummary()
library(gtsummary)
nhanes_2017Mar2020_svyobj %>% 
  tbl_svysummary(
    by = bmi_category,
    missing_text = "Missing",
    include = c(height,serum_glucose,
                toldhighbp,race
                ),
    type = list(height ~ "continuous2",
             serum_glucose ~ "continuous2",
             toldhighbp ~ "dichotomous",
             race ~ "categorical"
             ), 
    statistic = list(serum_glucose ~ c("{mean} ({sd})","{N_miss_unweighted}"),
                     all_categorical() ~ "{p}%",
                     all_dichotomous() ~ "{p}%",
                     height ~ c("{median} ({p25}, {p75})","{N_nonmiss_unweighted}"))
  ) %>% 
  add_n(statistic =  "{N_obs_unweighted}") %>% # See add_n.tbl_summary for more details
  add_overall() %>%
  as_gt() %>%
  gt::gtsave(filename = "analysis/example_survey table 1.docx")



# # However, I wrote the below function which tends to be a little faster - please feel free to use/discard
# # You can basically use the same set of functions that I used (survey_mean, survey_prop etc.)
# # Found at: https://github.com/jvargh7/functions/survey/svysummary.R
# source("C:/code/external/functions/survey/svysummary.R")
# source("C:/code/external/functions/survey/svysd.R")
# 
# selected_c_vars = c("height","serum_glucose")
# selected_p_vars = c("toldhighbp")
# selected_g_vars = c("race")
# 
# 
# means_and_proportions_overall = svysummary(
#   svy_des = nhanes_2017Mar2020_svyobj,
#   c_vars = selected_c_vars,
#   p_vars = selected_p_vars,
#   g_vars = selected_g_vars,
#   id_vars = "bmi_category")
# 
# sds = svysd(svy_des = nhanes_2017Mar2020_svyobj,
#       c_vars = selected_c_vars)
