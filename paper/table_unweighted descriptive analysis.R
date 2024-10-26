rm(list=ls());gc();source(".Rprofile")


### Table 1 by clusters

mean_vars = c("age","dm_age","bmi","fat_percentage","alt","ast","sbp","dbp","egfr","waistcircumference","ldl","hdl","triglyceride","fasting_glucose")

median_vars = c("glycohemoglobin")

table_df <- read_csv("analysis/ncan01b_unweighted characteristics of overall sample and by cluster.csv") %>% 
  dplyr::mutate(selected_rows = case_when(variable %in% mean_vars & est %in% c("mean","sd") ~ 1,
                                          variable %in% median_vars & est %in% c("median","q25","q75") ~ 1,
                                          !variable %in% c(mean_vars,median_vars) ~ 1,
                                          TRUE ~ 0
  )) %>% 
  dplyr::filter(selected_rows == 1) %>% 
  dplyr::select(cluster,group,variable,est,value) %>% 
  pivot_wider(names_from=est,values_from=value) %>% 
  mutate(output = case_when(variable %in% mean_vars ~ paste0(round(mean,1)," (",round(sd,1),")"),
                            variable %in% median_vars ~ paste0(round(median,1)," (",round(q25,1),", ",round(q75,1),")"),
                            TRUE ~ paste0(round(freq,0)," (",round(proportion,1),"%)")
  )) %>% 
  dplyr::select(variable,group,cluster,output) %>% 
  pivot_wider(names_from=cluster,values_from=output) %>% 
  dplyr::select(variable,group,Total,MARD,MOD,SIDD,SIRD)

write_csv(table_df,"paper/table_unweighted descriptive characteristics by cluster.csv")  

#----------------------------------------------------------------------------------------------------------------------------------
### Table 2 by sample

mean_vars = c("age","dm_age","bmi","fat_percentage","alt","ast","sbp","dbp","egfr","waistcircumference","ldl","hdl","triglyceride","fasting_glucose")

median_vars = c("glycohemoglobin")

table_df <- read_csv("analysis/ncan02b_unweighted characteristics of all by sample.csv") %>% 
  dplyr::mutate(selected_rows = case_when(variable %in% mean_vars & est %in% c("mean","sd") ~ 1,
                                          variable %in% median_vars & est %in% c("median","q25","q75") ~ 1,
                                          !variable %in% c(mean_vars,median_vars) ~ 1,
                                          TRUE ~ 0
  )) %>% 
  dplyr::filter(selected_rows == 1) %>% 
  dplyr::select(newdm,group,variable,est,value) %>% 
  pivot_wider(names_from=est,values_from=value) %>% 
  mutate(output = case_when(variable %in% mean_vars ~ paste0(round(mean,1)," (",round(sd,1),")"),
                            variable %in% median_vars ~ paste0(round(median,1)," (",round(q25,1),", ",round(q75,1),")"),
                            TRUE ~ paste0(round(freq,0)," (",round(proportion,1),"%)")
  )) %>% 
  dplyr::select(variable,group,newdm,output) %>% 
  pivot_wider(names_from=newdm,values_from=output) %>% 
  dplyr::select(variable,group,Total,newdm,non_newdm)

write_csv(table_df,"paper/table_unweighted descriptive characteristics of all by sample.csv")  

#----------------------------------------------------------------------------------------------------------------------------------
### Table 2 by sample

mean_vars = c("age","dm_age","bmi","fat_percentage","alt","ast","sbp","dbp","egfr","waistcircumference","ldl","hdl","triglyceride","fasting_glucose")

median_vars = c("glycohemoglobin")

table_df <- read_csv("analysis/ncan02b_unweighted characteristics of newly or undiagnosed by sample.csv") %>% 
  dplyr::mutate(selected_rows = case_when(variable %in% mean_vars & est %in% c("mean","sd") ~ 1,
                                          variable %in% median_vars & est %in% c("median","q25","q75") ~ 1,
                                          !variable %in% c(mean_vars,median_vars) ~ 1,
                                          TRUE ~ 0
  )) %>% 
  dplyr::filter(selected_rows == 1) %>% 
  dplyr::select(vars_ava,group,variable,est,value) %>% 
  pivot_wider(names_from=est,values_from=value) %>% 
  mutate(output = case_when(variable %in% mean_vars ~ paste0(round(mean,1)," (",round(sd,1),")"),
                            variable %in% median_vars ~ paste0(round(median,1)," (",round(q25,1),", ",round(q75,1),")"),
                            TRUE ~ paste0(round(freq,0)," (",round(proportion,1),"%)")
  )) %>% 
  dplyr::select(variable,group,vars_ava,output) %>% 
  pivot_wider(names_from=vars_ava,values_from=output) %>% 
  dplyr::select(variable,group,Total,var_available,var_notavailable)

write_csv(table_df,"paper/table_unweighted descriptive characteristics of newly or undiagnosed by sample.csv")  

