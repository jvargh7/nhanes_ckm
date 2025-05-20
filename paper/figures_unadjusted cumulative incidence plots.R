


source("analysis/ncan_analytic sample for survival.R")

unadjusted_curves_mortality <- function(outcome_var, analytic_sample, outcome_label) {
  
  cox_reg <- coxph(
    as.formula(paste0("Surv(censoring_time, ", outcome_var, ") ~ strata(cluster)")),
    data = analytic_sample,
    weights = pooled_weight  # Add weights here
  )
  
  upper_limit = case_when(outcome_var == "mortstat" ~ 0.5,
                          outcome_var %in% c("mortality_heart", "mortality_malignant_neoplasms",
                                             "mortality_any_other") ~ 0.3,
                          TRUE ~ 0.1)
  seq_limit = case_when(outcome_var == "mortstat" ~ 0.1,
                        outcome_var %in% c("mortality_heart", "mortality_malignant_neoplasms",
                                           "mortality_any_other") ~ 0.05,
                        TRUE ~ 0.02)
  
  fig_out = ggsurvfit(survfit2(cox_reg), type = "risk") +
    xlab(paste0("Time to ", outcome_label)) +
    ylab("Event (proportion)") +
    add_confidence_interval() +
    theme_bw() +
    scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
    scale_fill_manual(name = "", values = cluster_colors_cosmos_all) +
    theme(axis.text = element_text(size = 8),
          legend.text = element_text(size = 8),
          legend.position = c(0.2, 0.8),
          axis.title = element_text(size = 8)) +
    scale_x_continuous(breaks = seq(0, 240, by = 60), limits = c(0, 280)) +
    scale_y_continuous(breaks = seq(0, upper_limit, by = seq_limit), limits = c(0, upper_limit)) +
    add_risktable()
  
  return(fig_out)
}

unadjusted_plots <- list()
for (i in 1:4){
  unadjusted_plots[[diseases[i]]] <- unadjusted_curves_mortality(outcome_var = diseases[i],
                                                                 analytic_sample = analytic_sample,
                                                                 outcome_label = disease_labels[i])
  
}



library(ggpubr)
library(gridExtra)

# Increase font sizes and add margins to prevent labels from being cut off
combined_unadjusted_plot <- do.call(ggarrange, 
                                    c(unadjusted_plots, 
                                      list(ncol = 4, 
                                           nrow = 1, 
                                           common.legend = TRUE, 
                                           legend = "bottom"))) +
  theme(plot.title = element_text(size = 14),  # Adjust the title font size
        axis.title = element_text(size = 12), # Adjust axis title font size
        axis.text = element_text(size = 10),  # Adjust axis tick labels font size
        legend.text = element_text(size = 12),# Adjust legend font size
        legend.title = element_text(size = 12),
        plot.margin = margin(10, 10, 20, 10)) # Add extra space at the bottom

# Save the plot with adjusted dimensions and margins
ggsave(combined_unadjusted_plot, 
       filename = paste0(path_nhanes_ckm_folder, "/figures/KM curve by cause of death.png"), 
       width = 10,  # Adjusted width
       height = 6,  # Slightly increased height for x-axis labels
       dpi = 300)   # High resolution for clarity



