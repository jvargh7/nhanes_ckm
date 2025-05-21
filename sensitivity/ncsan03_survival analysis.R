rm(list=ls());gc();source(".Rprofile")

#### Load the required libraries
library(survival)
library(ggsurvfit)

######################## R script for Kaplan-Meier curve ################################

source("sensitivity/ncsan_analytic sample for survival.R")

source("functions/regression_mortality.R")

analytic_sample %>%
  summarize(across(diseases, ~mean(., na.rm = TRUE))) %>%
  write_csv(., "sensitivity/ncsan03_overall rates for all follow-up.csv")

analytic_sample %>% 
  dplyr::select(one_of(diseases)) %>% 
  summarize_all(~sum(.,na.rm=TRUE))

analytic_sample %>% 
  group_by(cluster) %>% 
  summarize(q = quantile(censoring_time,probs=c(0.25,0.5,0.75)))


regression_results <- list()

pdf(file=paste0(path_nhanes_ckm_folder,"/figures/ncsan03_PH Assumption.pdf"))
for (i in c(1:4)) {
  regression_results[[diseases[i]]] <- regression_mortality(outcome_var = diseases[i],
                                                            df = analytic_sample,include_s3 = TRUE)
}
dev.off()


regression_results %>%
  bind_rows() %>%
  write_csv(., "sensitivity/ncsan03_survival analysis results.csv")

# regression_results <- read_csv("sensitivity/ncsan03_survival analysis results.csv")

