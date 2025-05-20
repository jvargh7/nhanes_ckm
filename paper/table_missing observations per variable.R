# Clear environment and load configuration
rm(list = ls()); gc(); source(".Rprofile")

# Load the analytic sample
source("analysis/ncan_analytic sample for survival.R")

# Function to count NAs for each variable in a given dataset
na_count <- function(data, variables) {
  sapply(variables, function(var) sum(is.na(data[[var]])))
}

# Define the variables to check
variables_to_check <- c(
  "gender", "race", "insured",
  "hhincome", "age", "dm_age", "bmi", "fat_percentage", "waistcircumference",
  "glycohemoglobin", "fasting_glucose","insulin_level", "ldl", "hdl", "sbp", "dbp",
  "triglyceride", "homa2b", "homa2ir", "egfr", "alt", "ast"
)

# Compute overall NA counts
overall_na_counts <- na_count(analytic_sample, variables_to_check)

# Get unique cluster IDs
clusters <- unique(analytic_sample$cluster)

# Compute NA counts by cluster
cluster_na_counts <- lapply(clusters, function(clust) {
  cluster_data <- subset(analytic_sample, cluster == clust)
  na_count(cluster_data, variables_to_check)
})

# Combine results into a single data frame
cluster_na_counts_df <- do.call(cbind, cluster_na_counts)
colnames(cluster_na_counts_df) <- paste0("Cluster_", clusters)

# Combine overall and cluster-specific NA counts
na_table <- cbind(Overall = overall_na_counts, cluster_na_counts_df)

# Save to CSV
write.csv(na_table,
          file = paste0("paper/table_missing counts of overall sample and by cluster.csv"),
          row.names = TRUE)
