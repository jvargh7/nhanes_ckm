# Flexible Parametric Models (Royston-Parmar) -------------
library(rstpm2)

rp01 <- stpm2(Surv(censoring_time,mortstat) ~ cluster  + gender + dm_age + smoke_current, data=analytic_sample, df = 4)


summary(rp01)



# Flexible Parametric Models with Splines ------------
library(flexsurv)

# Use generalized gamma or spline-based distributions
fit_flex <- flexsurvspline(Surv(censoring_time,mortstat) ~ cluster  + gender + dm_age + smoke_current, data=analytic_sample, k = 3)

summary(fit_flex)

predict(fit_flex, newdata = data.frame(cluster = "MOD", dm_age = 60,gender = 0, smoke_current = 1), type = "survival", times = c(36, 60, 120)) %>% unlist()
