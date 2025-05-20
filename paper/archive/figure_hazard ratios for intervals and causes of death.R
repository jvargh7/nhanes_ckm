rm(list=ls()); gc(); source(".Rprofile")

# Loading in the regression results files:
overall_results <- read_csv(paste0(path_nhanes_ckm_repo, "/analysis/ncan03_survival analysis results.csv"))
fiveyear_results <- read_csv(paste0(path_nhanes_ckm_repo,"/analysis/ncan04_survival analysis for 10 year follow-up.csv"))
tenyear_results <- read_csv(paste0(path_nhanes_ckm_repo,"/analysis/ncan05_survival analysis for 5 year follow-up.csv"))

# Creating a formula to format the estimates:
format_regression_results <- function(regression_results, diseases, disease_labels,model_name) {
  regression_results %>% 
    bind_rows() %>% 
    mutate(
      HR = exp(estimate),
      lci = exp(estimate - 1.96 * std.error),
      uci = exp(estimate + 1.96 * std.error),
      model = case_when(
        model == "m0" ~ "Unadjusted",
        model == "m1" ~ "Age-adjusted",
        model == "m2" ~ "Age-, sex-, and smoking-adjusted",
        model == "s0" ~ "Survey Unadjusted",
        model == "s2" ~ "Survey Age-, sex-, and smoking-adjusted",
        TRUE ~ NA_character_
      )
    ) %>% 
    dplyr::filter(model == model_name, str_detect(term, "cluster")) %>% 
    mutate(
      cluster = str_replace(term, "cluster_", ""),
      coef_ci = paste0(round(HR, 2), " (", round(lci, 2), ", ", round(uci, 2), ")"),
      outcome = factor(outcome, levels = diseases, labels = disease_labels)
    ) %>% 
    dplyr::select(outcome, cluster, coef_ci) %>% 
    pivot_wider(names_from = cluster, values_from = coef_ci) %>% 
    mutate(MARD = "Ref") %>% 
    dplyr::select(outcome, MARD, MOD, SIDD, SIRD)
}

# Applying the formula:
formatted_overall_results <- format_regression_results(overall_results, diseases, disease_labels, model_name = "Age-, sex-, and smoking-adjusted")
formatted_fiveyear_results <- format_regression_results(fiveyear_results, diseases, disease_labels, model_name = "Age-, sex-, and smoking-adjusted")
formatted_tenyear_results <- format_regression_results(tenyear_results, diseases, disease_labels, model_name = "Age-, sex-, and smoking-adjusted")


bind_rows(formatted_overall_results%>% mutate(type = "overall"),
          formatted_fiveyear_results%>% mutate(type = "5y"),
          formatted_tenyear_results%>% mutate(type = "10y")) %>% 
  write_csv(.,"paper/table_adjusted hazard ratios for all cause and cause specific.csv")


bind_rows(format_regression_results(overall_results, diseases, disease_labels, model_name = "Age-adjusted") %>% mutate(type = "overall"),
          format_regression_results(fiveyear_results, diseases, disease_labels, model_name = "Age-adjusted") %>% mutate(type = "5y"),
          format_regression_results(tenyear_results, diseases, disease_labels, model_name = "Age-adjusted") %>% mutate(type = "10y")) %>% 
  write_csv(.,"paper/table_age-adjusted adjusted hazard ratios for all cause and cause specific.csv")

bind_rows(format_regression_results(overall_results, diseases, disease_labels, model_name = "Survey Age-, sex-, and smoking-adjusted") %>% mutate(type = "overall"),
          format_regression_results(fiveyear_results, diseases, disease_labels, model_name = "Survey Age-, sex-, and smoking-adjusted") %>% mutate(type = "5y"),
          format_regression_results(tenyear_results, diseases, disease_labels, model_name = "Survey Age-, sex-, and smoking-adjusted") %>% mutate(type = "10y")) %>% 
  write_csv(.,"paper/table_survey adjusted hazard ratios for all cause and cause specific.csv")




# Creating a formula to prepare the data for forest plot creation:
prepare_forest_plot_data <- function(data) {
  data %>%
    pivot_longer(cols = c(MOD, SIDD, SIRD), names_to = "subtype", values_to = "coef_ci") %>%
    mutate(
      HR = as.numeric(str_extract(coef_ci, "^[0-9.]+")),                  # Extract HR
      lci = as.numeric(str_extract(coef_ci, "(?<=\\()[0-9.]+")),         # Extract lower CI
      uci = as.numeric(str_extract(coef_ci, "(?<=, )[0-9.]+(?=\\))")),   # Extract upper CI
      label = sprintf("%.2f", HR)                                       # Add HR labels
    ) %>%
    select(outcome, subtype, HR, lci, uci, label)  # Keep only relevant columns
}

# Applying the new formula:
ready_overall_results <- prepare_forest_plot_data(formatted_overall_results)
ready_fiveyear_results <- prepare_forest_plot_data(formatted_fiveyear_results)
ready_tenyear_results <- prepare_forest_plot_data(formatted_tenyear_results)

# Updated plot function with HR labels
plot_with_labels <- function(data) {
  ggplot(data, aes(y = outcome, x = HR, color = subtype)) +
    geom_point(position = position_dodge(width = 0.5)) +  # Plot HR points
    geom_errorbarh(aes(xmin = lci, xmax = uci), 
                   position = position_dodge(width = 0.5), height = 0.2) +  # 95% CI
    geom_text(aes(label = label), 
              position = position_dodge(width = 0.5), vjust = -1, size = 4) +  # Place labels above dots
    geom_vline(xintercept = 1, linetype = "dashed") +  # Reference line at HR = 1
    labs(
      x = "Hazard Ratio (95% CI)",  # Only x-axis label
      y = NULL
    ) +
    theme_bw() +
    scale_x_continuous(limits=c(0,3.5),breaks=seq(0,4,by=0.5)) + 
    scale_y_discrete(limits=rev) +
    scale_color_manual(name = "", values = cluster_colors_cosmos_all) +
    theme(
      legend.position = "bottom",
      plot.title = element_blank()  # Remove plot title
    )
}

# Create labeled plots with custom x-axis ranges
plot_overall <- plot_with_labels(ready_overall_results)
plot_5y <- plot_with_labels(ready_fiveyear_results)
plot_10y <- plot_with_labels(ready_tenyear_results)


library(ggpubr)

# Combine the three plots into a single panel layout with wider plots
combined_plot <- ggarrange(
  plot_5y, plot_10y,plot_overall, 
  nrow = 1, ncol = 3,
  common.legend = TRUE,                # Use a common legend for all plots
  legend = "bottom",                   # Place the legend at the bottom
  labels = c("5-Year", "10-Year","Overall"),  # Label each plot
  widths = c(1, 1, 1)                  # Ensure equal widths for each plot
)

# Save the updated plot with increased width
ggsave(filename = paste0(path_nhanes_ckm_folder, "/figures/hazard_ratios.png"), 
       plot = combined_plot, width = 12, height = 6) 

