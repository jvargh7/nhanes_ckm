rm(list=ls()); gc(); source(".Rprofile")

# Load the required libraries
library(survival)
library(ggsurvfit)
library(ggpubr)
library(dplyr)
library(broom)
library(tidyr)
library(ggplot2)
library(patchwork)

# Run the necessary analysis:
source("analysis/ncan03_survival analysis.R")
source("analysis/ncan04_survival analysis for 10 year followup.R")
source("analysis/ncan05_survival analysis for 5 year followup.R")

# Define diseases and their corresponding labels
diseases <- c("mortstat", "mortality_heart", "mortality_malignant_neoplasms", "mortality_any_other")
disease_labels <- c("All-Cause Mortality", "Heart Disease Mortality", "Cancer Mortality", "Other Causes")

# Loading in the regression results files:
overall_results <- read_csv(paste0(path_nhanes_ckm_repo, "/analysis/ncan03_survival_analysis_results.csv"))
fiveyear_results <- read_csv(paste0(path_nhanes_ckm_repo,"/analysis/ncan04_survival analysis for 10 year follow-up.csv"))
tenyear_results <- read_csv(paste0(path_nhanes_ckm_repo,"/analysis/ncan05_survival analysis for 5 year follow-up.csv"))

# Creating a formula to format the estimates:
format_regression_results <- function(regression_results, diseases, disease_labels) {
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
        TRUE ~ NA_character_
      )
    ) %>% 
    dplyr::filter(model == "Age-, sex-, and smoking-adjusted", str_detect(term, "cluster")) %>% 
    mutate(
      cluster = str_replace(term, "cluster", ""),
      coef_ci = paste0(round(HR, 2), " (", round(lci, 2), ", ", round(uci, 2), ")"),
      outcome = factor(outcome, levels = diseases, labels = disease_labels)
    ) %>% 
    dplyr::select(outcome, cluster, coef_ci) %>% 
    pivot_wider(names_from = cluster, values_from = coef_ci) %>% 
    mutate(MARD = "Ref") %>% 
    dplyr::select(outcome, MARD, MOD, SIDD, SIRD)
}

# Applying the formula:
formatted_overall_results <- format_regression_results(overall_results, diseases, disease_labels)
formatted_fiveyear_results <- format_regression_results(fiveyear_results, diseases, disease_labels)
formatted_tenyear_results <- format_regression_results(tenyear_results, diseases, disease_labels)

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



# Combine the three plots into a single panel layout with wider plots
combined_plot <- ggarrange(
  plot_overall, plot_5y, plot_10y,
  nrow = 1, ncol = 3,
  common.legend = TRUE,                # Use a common legend for all plots
  legend = "bottom",                   # Place the legend at the bottom
  labels = c("Overall", "5-Year", "10-Year"),  # Label each plot
  widths = c(1, 1, 1)                  # Ensure equal widths for each plot
)

# Save the updated plot with increased width
ggsave(filename = paste0(path_nhanes_ckm_folder, "/figures/hazard_ratios.png"), 
       plot = combined_plot, width = 12, height = 6) 

