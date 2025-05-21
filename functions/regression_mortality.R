regression_mortality <- function(outcome_var, df,include_s3 = FALSE) {
  
  des = svydesign(id = ~psu, strata = ~pseudostratum, weights = ~pooled_weight, data = df, nest = TRUE)
  
  
  s0 <- svycoxph(as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD")),
                 design = des
  )
  
  s1 <- svycoxph(as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD + dm_age + year_fe")),
                 design = des
  )
  
  s2 <- svycoxph(as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD + gender + dm_age + smoke_current + year_fe")),
                 design = des
  )


  
  
  m0 <- coxph(as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD")),
              data = df
  )
  
  m1 <- coxph(as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD + dm_age + year_fe")),
              data = df
  )
  
  m2 <- coxph(as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD + gender + dm_age + smoke_current + year_fe")),
              data = df
  )  
  
  
  
  
  NPH_CHECK = cox.zph(s2)
  
  par(mfrow=c(2,3))
  plot(NPH_CHECK)
  mtext(paste0(disease_labels[outcome_var]," -  (Weighted)"), side = 3, line = - 2, outer = TRUE)
  
  print(NPH_CHECK$table)
  
  regression_output = bind_rows(
    broom::tidy(s0) %>% mutate(model = "s0"),
    broom::tidy(s1) %>% mutate(model = "s1"),
    broom::tidy(s2) %>% mutate(model = "s2"),
    broom::tidy(m0) %>% mutate(model = "m0"),
    broom::tidy(m1) %>% mutate(model = "m1"),
    broom::tidy(m2) %>% mutate(model = "m2")
  ) %>%
    mutate(outcome = outcome_var)
  
  
  if(include_s3){
    # Only for sensitivity/ncsan...
    # + duration
    s3 <- svycoxph(as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ cluster_MOD + cluster_SIDD + cluster_SIRD + gender + dm_age + smoke_current + rx_insulin + rx_otherdm + rx_chol + rx_htn + year_fe + duration")),
                   design = des
    )
    
    regression_output = regression_output %>% 
      bind_rows(broom::tidy(s3) %>% mutate(model = "s3")) %>% 
      mutate(outcome = outcome_var)
    
  }
  
  
  regression_output %>%
    return(.)
}
