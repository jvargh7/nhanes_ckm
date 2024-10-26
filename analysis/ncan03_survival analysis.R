### The purpose of this R file is to create a template for the R codes for KM curve and PH Cox regression analysis

#### Load the required libraries
library(survival)
library(ggsurvfit)

# Load in the imputed and clustered data set:
clustered_set <- read_csv(paste0(path_nhanes_ckm_newdm, "/knn clusters.csv")) %>% 
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
                             mortality_data,
                             by = "respondentid") %>% 
  # event status
  mutate(heart = case_when(ucod_leading == 1 ~ 1,
                           TRUE ~ 0),
         malignant_neoplasms = case_when(ucod_leading == 2 ~ 1,
                           TRUE ~ 0),
         chronic_lower_respiratory  = case_when(ucod_leading == 3 ~ 1,
                           TRUE ~ 0),
         accidents = case_when(ucod_leading == 4 ~ 1,
                           TRUE ~ 0),
         cerebrovascular = case_when(ucod_leading == 5 ~ 1,
                           TRUE ~ 0),
         alzheimer = case_when(ucod_leading == 6 ~ 1,
                           TRUE ~ 0),
         diabetes_mellitus = case_when(ucod_leading == 7 ~ 1,
                           TRUE ~ 0),
         influenza_pneumonia  = case_when(ucod_leading == 8 ~ 1,
                           TRUE ~ 0),
         nephrosis = case_when(ucod_leading == 9 ~ 1,
                           TRUE ~ 0),
         other = case_when(ucod_leading == 10 ~ 1,
                           TRUE ~ 0)) %>% 
  # time to event
  mutate(t_all = permth_exm,
         t_heart = case_when(heart == 1 ~ permth_exm,
                             TRUE ~ NA),
         t_mn = case_when(malignant_neoplasms == 1 ~ permth_exm,
                             TRUE ~ NA),
         t_clr = case_when(chronic_lower_respiratory == 1 ~ permth_exm,
                             TRUE ~ NA),
         t_acc = case_when(accidents == 1 ~ permth_exm,
                             TRUE ~ NA),
         t_cere = case_when(cerebrovascular == 1 ~ permth_exm,
                             TRUE ~ NA),
         t_alz = case_when(alzheimer == 1 ~ permth_exm,
                             TRUE ~ NA),
         t_dm = case_when(diabetes_mellitus == 1 ~ permth_exm,
                             TRUE ~ NA),
         t_ip = case_when(influenza_pneumonia == 1 ~ permth_exm,
                             TRUE ~ NA),
         t_neph = case_when(nephrosis == 1 ~ permth_exm,
                             TRUE ~ NA),
         t_other = case_when(other == 1 ~ permth_exm,
                             TRUE ~ NA))
  


######################## R script for Kaplan-Meier curve ################################

cluster_colors_cosmos_all <- c("red", "blue", "green", "yellow")  


create_survival_plot <- function(data, time_var, event_var, x_label, cluster_colors) {
  # Ensure the time variable is treated as numeric if it's an integer
  data[[time_var]] <- as.numeric(data[[time_var]])
  
  # Fit the survival model using the correct handling of variable names
  surv_object <- survfit(Surv(get(time_var), get(event_var)) ~ cluster, data = data)
  
  # Assuming ggsurvfit() is available and correctly processes a survfit object
  plot <- ggsurvfit(surv_object) +
    xlab(x_label) +  # Customize the x-axis label
    ylab("Event (proportion)") +  # Customize the y-axis label
    add_confidence_interval() +
    add_risktable(risktable_stats = c("n.risk")) +
    theme_bw() +
    scale_color_manual(name = "", values = cluster_colors) +
    scale_fill_manual(name = "", values = cluster_colors) +
    theme(
      axis.text = element_text(size = 14),
      legend.text = element_text(size = 14),
      legend.position = "bottom",
      axis.title = element_text(size = 16)
    ) +
    scale_x_continuous(limits = c(0, 60), breaks = seq(0, 50, by = 10)) +
    scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, by = 0.1))
  
  return(plot)
}



diseases <- c("mortstat","heart", "malignant_neoplasms", "chronic_lower_respiratory", "accidents", 
              "cerebrovascular", "alzheimer", "diabetes_mellitus", "influenza_pneumonia", 
              "nephrosis", "other")

time_vars <- c("t_all","t_heart", "t_mn", "t_clr", "t_acc", 
               "t_cere", "t_alz", "t_dm", "t_ip", 
               "t_neph", "t_other")

# Loop through each disease to create and print plots
plots <- list()
for (i in seq_along(diseases)) {
  x_label <- sprintf("Time to %s mortality (months)", diseases[i])
  plots[[diseases[i]]] <- create_survival_plot(data = analytic_sample,
                                               time_var = time_vars[i],
                                               event_var = diseases[i],
                                               x_label = x_label,
                                               cluster_colors = cluster_colors_cosmos_all)
  print(plots[[diseases[i]]])  # Optionally print or save each plot
}



library(ggpubr)

combined_plot <- do.call(ggarrange,c(plots, list(ncol = 3, nrow = 4, common.legend = TRUE,legend = "bottom")))  %>% 
  ggsave(.,filename=paste0(path_nhanes_ckm_folder,"/figures/KM curve by cause of death.jpg"),width=20,height =20)



########################  R script for Cox Proportional Hazards Regression Analysis ################################
cluster_colors_cosmos_all <- c("red", "blue", "green", "yellow")  











combined_plot <- do.call(ggarrange,c(plots, list(ncol = 3, nrow = 4, common.legend = TRUE,legend = "bottom")))  %>% 
  ggsave(.,filename=paste0(path_nhanes_ckm_folder,"/figures/KM curve by cause of death.jpg"),width=20,height =20)











### All cause mortality
# first fit the Cox PH model with the subphenotype variable and other covariates (e.g. gender, age at diagnosis, and etc.)
cox_all <- coxph(Surv(t_to_all, mortstat) ~ cluster + gender + dm_age, # replace "t" with the time variable and "event" with the event variable in your dataset
                  data = analytic_sample)

all_cur <- survfit2(cox_all)

# plot the survival curves (adjusted for other covariates) for the subphenotypes
fig_all = ggsurvfit(all_cur, type = "risk") +
  xlab("Time to all cause mortality (months)") +
  ylab("Event (proportion)") +
  add_confidence_interval() +
  theme_bw() +
  
  scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
  scale_fill_manual(name = "", values = cluster_colors_cosmos_all) + # you should replace "cluster_colors_cosmos_all" with your own color scheme for the subphenotypes
  theme(axis.text = element_text(size = 14),
        legend.text = element_text(size = 14), # feel free to adjust the figure size, font size, etc. to your preference
        legend.position = c(0.2, 0.8),
        axis.title = element_text(size = 16)) +
  xlim(0, 60)

fig_all <- fig_all +
  scale_x_continuous(breaks = seq(0, 50, by = 10), limits = c(0, 60)) +
  scale_y_continuous(breaks = seq(0, 0.1, by = 0.02), limits = c(0, 0.1)) +
  add_risktable()

### Diabetes relevant mortality
# first fit the Cox PH model with the subphenotype variable and other covariates (e.g. gender, age at diagnosis, and etc.)
cox_dm <- coxph(Surv(t_to_dm, diabetes) ~ cluster + gender + dm_age, # replace "t" with the time variable and "event" with the event variable in your dataset
                 data = analytic_sample)

all_cur <- survfit2(cox_dm)

# plot the survival curves (adjusted for other covariates) for the subphenotypes
fig_dm = ggsurvfit(all_cur, type = "risk") +
  xlab("Time to diabetes relevant mortality (months)") +
  ylab("Event (proportion)") +
  add_confidence_interval() +
  theme_bw() +
  
  scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
  scale_fill_manual(name = "", values = cluster_colors_cosmos_all) + # you should replace "cluster_colors_cosmos_all" with your own color scheme for the subphenotypes
  theme(axis.text = element_text(size = 14),
        legend.text = element_text(size = 14), # feel free to adjust the figure size, font size, etc. to your preference
        legend.position = c(0.2, 0.8),
        axis.title = element_text(size = 16)) +
  xlim(0, 60)

fig_dm <- fig_dm +
  scale_x_continuous(breaks = seq(0, 50, by = 10), limits = c(0, 60)) +
  scale_y_continuous(breaks = seq(0, 0.5, by = 0.1), limits = c(0, 0.5)) +
  add_risktable()





library(ggpubr)

combined_plot <- ggarrange(fig_all, fig_dm, fig_htn, 
                           ncol = 3, nrow = 1, 
                           common.legend = TRUE, legend = "bottom")
