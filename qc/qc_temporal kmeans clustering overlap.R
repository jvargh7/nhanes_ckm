rm(list=ls()); gc(); source(".Rprofile")

# Load in the final analytic sample and then the temporal samples with clustering
source("analysis/ncan_analytic sample for survival.R")
early_sample <- read_csv(file.path(path_nhanes_ckm_folder, "working/new diabetes/knn_clusters_1999_2002.csv"))
late_sample <- read_csv(file.path(path_nhanes_ckm_folder, "working/new diabetes/knn_clusters_2015_2018.csv"))


