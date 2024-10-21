

### The purpose of this R file is to create a template for the R codes for KM curve and PH Cox regression analysis

#### Load the required libraries
library(survival)
library(ggsurvfit)


#### NOTE1: This is the codes we used for the adult subphenotype manuscript
#### NOTE2: your subphenotype variable (e.g., subphenotype_category below) should be a factor variable

######################## R script for Kaplan-Meier curve ################################

figA1 = survfit2(Surv(t, event) ~ subphenotype_category, # you need replace "t" with the time variable and "event" with the event variable in your dataset
                 data = insulin_df) %>% # replace "insulin_df" with your dataset
  ggsurvfit(.type = "risk") +
  xlab("Time to insulin (months)") + # replace "Time to insulin (months)" with your own x-axis label
  ylab("Event (proportion)") +
  add_confidence_interval() +
  add_risktable(risktable_stats = c("n.risk")) +
  theme_bw() +
  scale_color_manual(name = "", values = cluster_colors_cosmos_all) + # you should replace "cluster_colors_cosmos_all" with your own color scheme for the subphenotypes
  scale_fill_manual(name = "", values = cluster_colors_cosmos_all) + 
  theme(axis.text = element_text(size = 14), # feel free to adjust the figure size, font size, etc. to your preference
        legend.text = element_text(size = 14),
        legend.position = "bottom",
        axis.title = element_text(size = 16)) +
  scale_x_continuous(limits = c(0, 60), breaks = seq(0, 50, by = 10)) +
  scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, by = 0.2))

# you can create multiple figures and then use the ggarange function from the ggpubr package to arrange the figures into a single panel. 


########################  R script for Cox Proportional Hazards Regression Analysis ################################

# first fit the Cox PH model with the subphenotype variable and other covariates (e.g. gender, age at diagnosis, and etc.)
insulin1 <- coxph(Surv(t, event) ~ subphenotype_category + female + Dmagediag, # replace "t" with the time variable and "event" with the event variable in your dataset
                  data = insulin_df) # replace "insulin_df" with your dataset

insulin_cur <- survfit2(insulin1)

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