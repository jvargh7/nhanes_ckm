rm(list=ls()); gc(); source(".Rprofile")

# Load in the final analytic sample and then the temporal samples with clustering
source("analysis/ncan_analytic sample for survival.R")
early_sample <- read_csv(file.path(path_nhanes_ckm_folder, "working/new diabetes/knn_clusters_1999_2002.csv"))
late_sample <- read_csv(file.path(path_nhanes_ckm_folder, "working/new diabetes/knn_clusters_2015_2018.csv"))

# Function to compare samples
compare_clusters <- function(analytic_sample, sample, sample_name) {
  # Merge the data frames
  merged_data <- merge(analytic_sample, sample, 
                       by = c("respondentid", "year"), 
                       suffixes = c("_analytic", paste0("_", sample_name)))
  
  # Check if the clusters match
  merged_data$cluster_match <- merged_data[[paste0("cluster_", sample_name)]] == merged_data$cluster_analytic
  
  # Summarize the results
  summary_table <- table(merged_data$cluster_match)
  total <- sum(summary_table)  # Total number of comparisons
  proportion_discordant <- summary_table["FALSE"] / total  # Proportion discordant
  
  # Handle cases where there are no mismatches (if "FALSE" does not exist in summary_table)
  proportion_discordant <- ifelse(is.na(proportion_discordant), 0, proportion_discordant)
  
  mismatch_data <- merged_data[!merged_data$cluster_match, ]
  
  # Return results as a list
  list(
    sample_name = sample_name,
    summary = summary_table,
    proportion_discordant = proportion_discordant,
    mismatches = mismatch_data
  )
}

# Compare early_sample
early_results <- compare_clusters(analytic_sample, early_sample, "early")

# Compare late_sample
late_results <- compare_clusters(analytic_sample, late_sample, "late")

# Print summaries for both samples
cat("Early Sample Summary:\n")
print(early_results$summary)
cat("Proportion Discordant:", early_results$proportion_discordant, "\n")

cat("\nLate Sample Summary:\n")
print(late_results$summary)
cat("Proportion Discordant:", late_results$proportion_discordant, "\n")

