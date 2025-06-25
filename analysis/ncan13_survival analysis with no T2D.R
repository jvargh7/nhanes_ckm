rm(list=ls());gc();source(".Rprofile")

#### Load the required libraries
library(survival)
library(ggsurvfit)

######################## R script for Kaplan-Meier curve ################################

source("analysis/ncan_analytic sample for survival.R")

source("functions/regression_mortality.R")

analytic_sample_with_not2d %>%
  summarize(across(diseases, ~mean(., na.rm = TRUE))) %>%
  write_csv(., "analysis/ncan13_overall rates for all follow-up with no T2D.csv")

analytic_sample_with_not2d %>% 
  dplyr::select(one_of(diseases)) %>% 
  summarize_all(~sum(.,na.rm=TRUE))

analytic_sample_with_not2d %>% 
  group_by(cluster) %>% 
  summarize(q = quantile(censoring_time,probs=c(0.25,0.5,0.75)))


regression_results <- list()

pdf(file=paste0(path_nhanes_ckm_folder,"/figures/ncan13_PH Assumption.pdf"))
for (i in c(1:4)) {
  regression_results[[diseases[i]]] <- regression_mortality(outcome_var = diseases[i],
                                                            df = analytic_sample_with_not2d,
                                                            cluster_vars = c("cluster_MARD","cluster_MOD","cluster_SIDD","cluster_SIRD"), include_s3_wo_duration = TRUE)
}
dev.off()


regression_results %>%
  bind_rows() %>%
  write_csv(., "analysis/ncan13_survival analysis results with no T2D.csv")

# regression_results <- read_csv("analysis/ncan03_survival analysis results.csv")

