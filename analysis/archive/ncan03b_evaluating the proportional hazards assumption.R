rm(list=ls());gc();source(".Rprofile")

#### Load the required libraries
library(survival)
library(ggsurvfit)
library(survminer)

######################## R script for Kaplan-Meier curve ################################

source("analysis/ncan_analytic sample for survival.R")

analytic_svy = analytic_sample %>% svydesign(data = ., id = ~psu, strata = ~pseudostratum, weights = ~pooled_weight, nest = TRUE)


s0 <- svycoxph(
  as.formula(paste0("Surv(censoring_time, mortstat) ~ cluster_MOD + cluster_SIDD + cluster_SIRD + dm_age + gender + smoke_current")),
  design = analytic_svy
  # weights = pooled_weight  # Add weights here
)

cox.zph(s0)

NPH_CHECK = cox.zph(s0)

par(mfrow=c(1,3))
plot(NPH_CHECK)
mtext(paste0("All Cause - Overall (Weighted)"), side = 3, line = - 2, outer = TRUE)


m0 <- coxph(
  as.formula(paste0("Surv(censoring_time, mortstat) ~ cluster_MOD + cluster_SIDD + cluster_SIRD")),
  data = analytic_dataset
  # weights = pooled_weight  # Add weights here
)

NPH_CHECK_UNWEIGHTED = cox.zph(m0)
NPH_CHECK_UNWEIGHTED
par(mfrow=c(1,3))
plot(NPH_CHECK_UNWEIGHTED)
mtext(paste0("All Cause - Overall (Uneighted)"), side = 3, line = - 2, outer = TRUE)


analytic2 = survSplit(Surv(censoring_time,mortstat) ~ .,data=analytic_sample,cut=c(60,120),episode="ep",id="id") %>% 
  mutate(cluster = factor(cluster,levels=c("MARD","MOD","SIDD","SIRD")))

# View(analytic2[,c("censoring_time","mortstat","ep","id","respondentid","cluster")])

m1 <- coxph(
  as.formula(paste0("Surv(tstart,censoring_time,mortstat) ~ cluster:strata(ep)")),
  data = analytic2,
  weights = pooled_weight  # Add weights here
)

summary(m1)
# https://www.bookdown.org/rwnahhas/RMPH/survival-phassumption.html
m1_old <- coxph(
  as.formula(paste0("Surv(censoring_time,mortstat) ~ cluster_MOD + cluster_SIDD + cluster_SIRD + dm_age + gender + smoke_current")),
  data = analytic_sample,
  weights = pooled_weight  # Add weights here
)

NPH_CHECK <- cox.zph(m1_old)

par(mfrow=c(2,))
plot(NPH_CHECK)


m2_old <- coxph(
  as.formula(paste0("Surv(censoring_time,mortality_heart) ~ cluster_MOD + cluster_SIDD + cluster_SIRD + dm_age")),
  data = analytic_sample,
  weights = pooled_weight  # Add weights here
)

NPH_CHECK2 <- cox.zph(m2_old)

par(mfrow=c(2,2))
plot(NPH_CHECK2)
