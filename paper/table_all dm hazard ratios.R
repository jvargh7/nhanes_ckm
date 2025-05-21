
rm(list=ls());gc();source(".Rprofile")


ncan03 <- read_csv("sensitivity/ncsan03_survival analysis results.csv")
ncan04 <- read_csv("sensitivity/ncsan04_survival sensitivity for 10 year follow-up.csv")
ncan05 <- read_csv("sensitivity/ncsan05_survival sensitivity for 5 year follow-up.csv")


table_df <- bind_rows(ncan03 %>% mutate(period = "Overall"),
                      ncan04 %>% mutate(period = "10y"),
                      ncan05 %>% mutate(period = "5y")) %>% 
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96 * std.error),
         uci = exp(estimate + 1.96 * std.error))  %>% 
  dplyr::filter(model %in% c("s0","s2","m0","m2","s3"),
                str_detect(term, "cluster")) %>% 
  mutate(cluster = str_replace(term, "cluster_", ""),
         coef_ci = paste0(round(HR, 2), " (", round(lci, 2), ", ", round(uci, 2), ")")) %>% 
  dplyr::select(outcome, period, model,cluster, coef_ci) %>% 
  pivot_wider(names_from = c(model,cluster), values_from = coef_ci) %>% 
  mutate(MARD = "Ref") %>% 
  dplyr::select(outcome, MARD, everything())

write_csv(table_df,"paper/table_alldm hazard ratios.csv")
