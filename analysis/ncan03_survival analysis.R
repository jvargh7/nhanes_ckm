### The purpose of this R file is to create a template for the R codes for KM curve and PH Cox regression analysis
rm(list=ls());gc();source(".Rprofile")


#### Load the required libraries
library(survival)
library(ggsurvfit)

new_or_undiagnosed_dm <- readRDS(file = paste0(path_nhanes_ckm_newdm,"/new_or_undiagnosed_dm.rds")) %>% 
  dplyr::filter(year != "2017Mar2020") %>% 
  dplyr::select(respondentid,year,interview_period) %>% 
  mutate(median_date = case_when(interview_period == 1 ~ paste0(str_sub(year,5,8),"-01-30"),
                                 interview_period == 2 ~ paste0(str_sub(year,5,8),"-07-31"),
                                 TRUE ~ paste0(str_sub(year,5,8),"-04-30"))) %>% 
  mutate(median_date = ymd(median_date))

# Load in the imputed and clustered data set:
clustered_set <- read_csv(paste0(path_nhanes_ckm_newdm, "/knn clusters.csv"))  %>% 
  distinct(respondentid, .keep_all = TRUE) %>%
  mutate(cluster = as.factor(cluster))

# Ref: https://www.cdc.gov/nchs/data-linkage/mortality-public.htm

# ELIGSTAT--1: the survey participant was eligible for the mortality linkage, 
# 2: the survey participant was under age 18 and not eligible for public release, 
# 3: the survey participant was not linkage eligible due to having insufficient identifying data to conduct data linkage.

# All-cause death -- MORTSTAT: vital status code (0=Assumed alive, 1=Assumed deceased)
# Cause-specific death -- UCOD_LEADING: Underlying Leading Cause of Death: Recode 

# PERMTH_INT: follow-up time calculated using person months from the date of interview to the date of death or the end of the mortality period 

mortality_data <- read_rds(paste0(path_nhanes_ckm_folder,"/working/cleaned/ncdat12_ndi linked mortality data.RDS")) %>%
  rename(respondentid = seqn) %>% 
  dplyr::filter(eligstat == 1) %>% 
  distinct(respondentid, .keep_all = TRUE)

analytic_sample <- left_join(clustered_set,
                             mortality_data %>% dplyr::select(-year),
                             by = c("respondentid")) %>% 
  left_join(new_or_undiagnosed_dm,
            by=c("respondentid","year")) %>% 
  # event status
  mutate(mortality_heart = case_when(ucod_leading == 1 ~ 1,
                           TRUE ~ 0),
        mortality_malignant_neoplasms = case_when(ucod_leading == 2 ~ 1,
                           TRUE ~ 0),
        mortality_chronic_lower_respiratory  = case_when(ucod_leading == 3 ~ 1,
                           TRUE ~ 0),
        mortality_accidents = case_when(ucod_leading == 4 ~ 1,
                           TRUE ~ 0),
        mortality_cerebrovascular = case_when(ucod_leading == 5 ~ 1,
                           TRUE ~ 0),
        mortality_alzheimer = case_when(ucod_leading == 6 ~ 1,
                           TRUE ~ 0),
        mortality_diabetes_mellitus = case_when(ucod_leading == 7 ~ 1,
                           TRUE ~ 0),
        mortality_influenza_pneumonia  = case_when(ucod_leading == 8 ~ 1,
                           TRUE ~ 0),
        mortality_nephrosis = case_when(ucod_leading == 9 ~ 1,
                           TRUE ~ 0),
        mortality_other = case_when(ucod_leading == 10 ~ 1,
                           TRUE ~ 0),
        censoring_time = case_when(!is.na(permth_int) ~ permth_int,
                                   permth_int >= 300 ~ as.numeric(difftime(ymd("2019-12-31"),median_date,units="weeks"))/4,
                                    TRUE ~ as.numeric(difftime(ymd("2019-12-31"),median_date,units="weeks"))/4))
  


######################## R script for Kaplan-Meier curve ################################

cluster_colors_cosmos_all <- c("MOD"="#F8BDA4","SIRD"="#A1C3AC","SIDD"="#ACD9EA","MARD"="#D0ACC9")  

diseases <- c("mortstat",paste0("mortality_",c("heart", "malignant_neoplasms", "chronic_lower_respiratory", "accidents", 
                                               "cerebrovascular", "alzheimer", "diabetes_mellitus", "influenza_pneumonia", 
                                               "nephrosis", "other")))
disease_labels = c("All Cause","Heart","Malignant Neoplasms","Chronic Lower Respiratory",
                   "Accidents","Cerebrovascular","Alzheimer's","Diabetes","Influenza/Pneumonia",
                   "Nephrosis","Other")



unadjusted_curves_mortality <- function(outcome_var,df,outcome_label){
  
  cox_reg <- coxph(as.formula(paste0("Surv(censoring_time, ",outcome_var,") ~ strata(cluster)")), # replace "t" with the time variable and "event" with the event variable in your dataset
                   data = df)
  
  upper_limit = case_when(outcome_var == "mortstat" ~ 0.5,
                          outcome_var %in% c("mortality_heart","mortality_malignant_neoplasms",
                                             "mortality_other") ~ 0.3,
                        TRUE ~ 0.1)
  seq_limit = case_when(outcome_var == "mortstat" ~ 0.1,
                        outcome_var %in% c("mortality_heart","mortality_malignant_neoplasms",
                                           "mortality_other") ~ 0.05,
                        TRUE ~ 0.02)
  
  
  # plot the survival curves (adjusted for other covariates) for the subphenotypes
  fig_out = ggsurvfit(survfit2(cox_reg), type = "risk") +
    xlab(paste0("Unadjusted time to ",outcome_label," Mortality")) +
    ylab("Event (proportion)") +
    add_confidence_interval() +
    theme_bw() +
    
    scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
    scale_fill_manual(name = "", values = cluster_colors_cosmos_all) + # you should replace "cluster_colors_cosmos_all" with your own color scheme for the subphenotypes
    theme(axis.text = element_text(size = 14),
          legend.text = element_text(size = 14), # feel free to adjust the figure size, font size, etc. to your preference
          legend.position = c(0.2, 0.8),
          axis.title = element_text(size = 16)) +
    scale_x_continuous(breaks = seq(0, 240, by = 60), limits = c(0, 280)) +
    scale_y_continuous(breaks = seq(0, upper_limit, by = seq_limit), limits = c(0, upper_limit)) +
    add_risktable()
  
  
  return(fig_out)
  
}

adjusted_curves_mortality <- function(outcome_var,df,outcome_label){
  
  upper_limit = case_when(outcome_var == "mortstat" ~ 0.5,
                          outcome_var %in% c("mortality_heart","mortality_malignant_neoplasms",
                                             "mortality_other") ~ 0.3,
                          TRUE ~ 0.1)
  seq_limit = case_when(outcome_var == "mortstat" ~ 0.1,
                        outcome_var %in% c("mortality_heart","mortality_malignant_neoplasms",
                                           "mortality_other") ~ 0.05,
                        TRUE ~ 0.02)
  
  
  cox_reg <- coxph(as.formula(paste0("Surv(censoring_time, ",outcome_var,") ~ strata(cluster) + gender + dm_age")), # replace "t" with the time variable and "event" with the event variable in your dataset
                   data = df)
  
  # plot the survival curves (adjusted for other covariates) for the subphenotypes
  fig_out = ggsurvfit(survfit2(cox_reg), type = "risk") +
    xlab(paste0("Time to ",outcome_label," Mortality")) +
    ylab("Event (proportion)") +
    add_confidence_interval() +
    theme_bw() +
    
    scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
    scale_fill_manual(name = "", values = cluster_colors_cosmos_all) + # you should replace "cluster_colors_cosmos_all" with your own color scheme for the subphenotypes
    theme(axis.text = element_text(size = 14),
          legend.text = element_text(size = 14), # feel free to adjust the figure size, font size, etc. to your preference
          legend.position = c(0.2, 0.8),
          axis.title = element_text(size = 16)) +
    scale_x_continuous(breaks = seq(0, 240, by = 60), limits = c(0, 280)) +
    scale_y_continuous(breaks = seq(0, upper_limit, by = seq_limit), limits = c(0, upper_limit)) +
    add_risktable()
  
  
  return(fig_out)
  
}



# Loop through each disease to create and print plots
unadjusted_plots <- list()
adjusted_plots <- list()
for (i in seq_along(diseases)) {
  print(i)
  unadjusted_plots[[diseases[i]]] <- unadjusted_curves_mortality(outcome_var = diseases[i],
                                               df = analytic_sample,
                                               outcome_label = disease_labels[i])
  
  adjusted_plots[[diseases[i]]] <- adjusted_curves_mortality(outcome_var = diseases[i],
                                                               df = analytic_sample,
                                                               outcome_label = disease_labels[i])
  
}



library(ggpubr)

combined_unadjusted_plot <- do.call(ggarrange,c(unadjusted_plots, list(ncol = 3, nrow = 4, common.legend = TRUE,legend = "bottom")))  %>% 
  ggsave(.,filename=paste0(path_nhanes_ckm_folder,"/figures/KM curve by cause of death.jpg"),width=20,height =20)

combined_adjusted_plot <- do.call(ggarrange,c(adjusted_plots, list(ncol = 3, nrow = 4, common.legend = TRUE,legend = "bottom")))  %>% 
  ggsave(.,filename=paste0(path_nhanes_ckm_folder,"/figures/Adjusted Cumulative Incidence curve by cause of death.jpg"),width=20,height =20)


