### The purpose of this R file is to create a template for the R codes for KM curve and PH Cox regression analysis

#### Load the required libraries
library(survival)
library(ggsurvfit)

# Load in the imputed and clustered data set:
clustered_set <- read_csv(paste0(path_nhanes_ckm_newdm, "/knn clusters.csv"))

mortality_data <- read_rds(paste0(path_nhanes_ckm_folder,"/working/cleaned/ncdat12_ndi linked mortality data.RDS"))

mortality_data <- mortality_data %>%
  rename(respondentid = seqn)

clustered_set <- clustered_set %>% distinct(respondentid, .keep_all = TRUE)
mortality_data <- mortality_data %>% distinct(respondentid, .keep_all = TRUE)

# Merge the data sets:
analytic_sample <- left_join(clustered_set, mortality_data, by = "respondentid")

#### NOTE1: This is the codes we used for the adult subphenotype manuscript
#### NOTE2: your subphenotype variable (e.g., subphenotype_category below) should be a factor variable

######################## R script for Kaplan-Meier curve ################################

# Define the color scheme for your clusters
cluster_colors_cosmos_all <- c("red", "blue", "green", "yellow")  # Adjust colors as needed

# Adjust the plot code
figA1 <- survfit(Surv(permth_exm, mortstat) ~ cluster, data = analytic_sample) %>%
  ggsurvfit() +
  xlab("Time to insulin (months)") +  # Customize the x-axis label
  ylab("Event (proportion)") +        # Customize the y-axis label
  add_confidence_interval() +
  add_risktable(risktable_stats = c("n.risk")) +
  theme_bw() +
  scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
  scale_fill_manual(name = "", values = cluster_colors_cosmos_all) +
  theme(
    axis.text = element_text(size = 14),
    legend.text = element_text(size = 14),
    legend.position = "bottom",
    axis.title = element_text(size = 16)
  ) +
  scale_x_continuous(limits = c(0, 60), breaks = seq(0, 50, by = 10)) +
  scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, by = 0.2))

figA1


# you can create multiple figures and then use the ggarange function from the ggpubr package to arrange the figures into a single panel. 


########################  R script for Cox Proportional Hazards Regression Analysis ################################

# first fit the Cox PH model with the subphenotype variable and other covariates (e.g. gender, age at diagnosis, and etc.)
cox1 <- coxph(Surv(permth_exm, mortstat) ~ cluster + gender + dm_age, # replace "t" with the time variable and "event" with the event variable in your dataset
                  data = analytic_sample) # replace "insulin_df" with your dataset

insulin_cur <- survfit2(cox1)

# plot the survival curves (adjusted for other covariates) for the subphenotypes
figA1 = ggsurvfit(insulin_cur, type = "risk") +
  xlab("Time to insulin (months)") +
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

figA1 <- figA1 +
  scale_x_continuous(breaks = seq(0, 50, by = 10), limits = c(0, 60)) +
  add_risktable()


# you can create multiple figures and then use the ggarange function from the ggpubr package to arrange the figures into a single panel. 