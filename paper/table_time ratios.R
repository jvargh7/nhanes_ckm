
rm(list=ls());gc();source(".Rprofile")


ncan03 <- read_csv("analysis/archive/ncan03_coefficients of aft analysis for overall.csv")
ncan04 <- read_csv("analysis/archive/ncan04_coefficients of aft analysis for 10y followup.csv")
ncan05 <- read_csv("analysis/archive/ncan05_coefficients of aft analysis for 5y followup.csv")


table_df <- bind_rows(ncan03 %>% mutate(period = "Overall"),
                      ncan04 %>% mutate(period = "5y"),
                      ncan05 %>% mutate(period = "10y")) %>% 
  dplyr::filter(model %in% c("m0","m2"),
                str_detect(term, "cluster")) %>% 
  mutate(cluster = str_replace(term, "cluster", ""),
         coef_ci = paste0(round(HR, 2), " (", round(lci, 2), ", ", round(uci, 2), ")")) %>% 
  dplyr::select(outcome, period, model,cluster, coef_ci) %>% 
  pivot_wider(names_from = c(model,cluster), values_from = coef_ci) %>% 
  mutate(MARD = "Ref") %>% 
  dplyr::select(outcome, MARD, everything())

write_csv(table_df,"paper/table_time ratios.csv")
