
rm(list=ls());gc();source(".Rprofile")


ncan03 <- read_csv("analysis/ncan03_survival analysis results.csv")
ncan04 <- read_csv("analysis/ncan04_survival analysis for 10 year follow-up.csv")
ncan05 <- read_csv("analysis/ncan05_survival analysis for 5 year follow-up.csv")


table_df <- bind_rows(ncan03 %>% mutate(period = "Overall"),
                      ncan04 %>% mutate(period = "10y"),
                      ncan05 %>% mutate(period = "5y")) %>% 
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96 * std.error),
         uci = exp(estimate + 1.96 * std.error))  %>% 
  dplyr::filter(model %in% c("s0","s2","m0","m2"),
                str_detect(term, "cluster")) %>% 
  mutate(cluster = str_replace(term, "cluster_", ""),
         coef_ci = paste0(round(HR, 2), " (", round(lci, 2), ", ", round(uci, 2), ")")) %>% 
  dplyr::select(outcome, period, model,cluster, coef_ci) %>% 
  pivot_wider(names_from = c(model,cluster), values_from = coef_ci) %>% 
  mutate(MARD = "Ref") %>% 
  dplyr::select(outcome, MARD, everything())

write_csv(table_df,"paper/table_hazard ratios.csv")


ncan13 <- read_csv("analysis/ncan13_survival analysis results with no T2D.csv")
ncan14 <- read_csv("analysis/ncan14_survival analysis for 10 year follow-up with no T2D.csv")
ncan15 <- read_csv("analysis/ncan15_survival analysis for 5 year follow-up with no T2D.csv")

table_df_noT2D <- bind_rows(ncan13 %>% mutate(period = "Overall"),
                      ncan14 %>% mutate(period = "10y"),
                      ncan15 %>% mutate(period = "5y")) %>% 
  mutate(HR = exp(estimate),
         lci = exp(estimate - 1.96 * std.error),
         uci = exp(estimate + 1.96 * std.error))  %>% 
  dplyr::filter(model %in% c("s0","s3","m0","m3"),
                str_detect(term, "cluster")) %>% 
  mutate(cluster = str_replace(term, "cluster_", ""),
         coef_ci = paste0(round(HR, 2), " (", round(lci, 2), ", ", round(uci, 2), ")")) %>% 
  dplyr::select(outcome, period, model,cluster, coef_ci) %>% 
  pivot_wider(names_from = c(model,cluster), values_from = coef_ci) %>% 
  mutate(NoT2D = "Ref") %>% 
  dplyr::select(outcome, NoT2D, everything())

write_csv(table_df_noT2D,"paper/table_hazard ratios with no T2D.csv")
