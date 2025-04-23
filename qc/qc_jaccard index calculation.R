rm(list=ls());gc();source(".Rprofile")

source("analysis/ncan_analytic sample for survival.R")

# Ensure cluster is a character vector
analytic_sample$cluster <- as.character(analytic_sample$cluster)

# Function to calculate Jaccard Index
jaccard_index <- function(set1, set2) {
  intersection <- length(intersect(set1, set2))
  union <- length(union(set1, set2))
  return(intersection / union)
}

# Extract unique cluster categories
clusters <- unique(analytic_sample$cluster)

# Calculate pairwise Jaccard Indices
jaccard_indices <- list()
for (cl1 in clusters) {
  for (cl2 in clusters) {
    # Extract row indices for each cluster
    set1 <- which(analytic_sample$cluster == cl1)
    set2 <- which(analytic_sample$cluster == cl2)
    jaccard_indices[[paste(cl1, cl2, sep = "-")]] <- jaccard_index(set1, set2)
  }
}

# Convert the Jaccard indices to a data frame
jaccard_df <- data.frame(
  Pair = names(jaccard_indices),
  Jaccard = unlist(jaccard_indices)
)

# Calculate the average Jaccard Index
average_jaccard <- mean(jaccard_df$Jaccard)
print(jaccard_df)  # Displays pairwise Jaccard Indices
print(paste("Average Jaccard Index:", average_jaccard))

# The average Jaccard index is 0.25.
