# The purpose of this python file is to run k-means on five variables: age of diagnosis, BMI, HbA1c, fasting insulin, and fasting glucose
# Load libraries
import pandas as pd
import numpy as np
import os as os

import sklearn as sklearn

import matplotlib.pyplot as plt
import seaborn as sns
from kneed import KneeLocator
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score
from sklearn.preprocessing import StandardScaler

# Set the file path based on the user login
if os.getlogin() == "JVARGH7":
    path_nhanes_ckm_folder = "C:/Cloud/OneDrive - Emory University/Papers/NHANES CKM Cascade"
elif os.getlogin() == 'JGUO258':
    path_nhanes_ckm_folder = "C:/Users/JGUO258/OneDrive - Emory/NHANES CKM Cascade"
elif os.getlogin() == 'krishnasanaka':
    path_nhanes_ckm_folder = "/Users/krishnasanaka/Library/CloudStorage/OneDrive-Emory/NHANES CKM Cascade"
elif os.getlogin() == 'root':
    path_nhanes_ckm_folder = "/Users/krishnasanaka/Library/CloudStorage/OneDrive-Emory/NHANES CKM Cascade"

# Load the dataset
analytic_dataset = pd.read_csv(path_nhanes_ckm_folder + '/working/new diabetes/knn imputation.csv')

# Filter the dataset for rows from years 1999-2000 or 2001-2002
filtered_dataset = analytic_dataset[(analytic_dataset['year'] == 19992000) |
                                    (analytic_dataset['year'] == 20012002)]

# Define the columns to keep for clustering
columns_to_keep = ['dm_age', 'bmi', 'glycohemoglobin', 'homa2b', 'homa2ir', 'ldl', 'hdl', 
                   'triglyceride', 'alt', 'ast', 'sbp', 'dbp', 'egfr', 'waistcircumference']

# Select only the columns to keep from the filtered dataset
analytic_dataset_cluster = filtered_dataset[columns_to_keep].copy()

# Capture the columns that were not used for clustering
other_vars = filtered_dataset.drop(columns=columns_to_keep)

# Standardize the data
scaler = StandardScaler()
data_scaled = scaler.fit_transform(analytic_dataset_cluster[['bmi', 'dm_age', 'glycohemoglobin', 'homa2b', 'homa2ir']])

data_scaled = pd.DataFrame(data_scaled, columns=['bmi', 'dm_age', 'glycohemoglobin', 'homa2b', 'homa2ir'])

# Perform KMeans clustering
kmeans = KMeans(init="random", n_clusters=4, n_init=10, max_iter=300, random_state=57)
kmeans.fit(data_scaled)

# Add cluster labels to the original filtered dataset with selected columns
analytic_dataset_cluster['cluster'] = kmeans.labels_

# Relabel the cluster labels based on clinical characteristics
analytic_dataset_cluster['cluster'] = analytic_dataset_cluster['cluster'].replace({0: 'SIDD', 1: 'SIRD', 2: 'MARD', 3: 'MOD'})

# Concatenate the other variables back to the filtered dataset
analytic_dataset_cluster = pd.concat([analytic_dataset_cluster, other_vars], axis=1)

# Check the final counts for each cluster
print(analytic_dataset_cluster['cluster'].value_counts())

# Save the filtered and clustered dataset
analytic_dataset_cluster.to_csv(path_nhanes_ckm_folder + '/working/new diabetes/knn_clusters_1999_2002.csv', index=False)

# Plot the clusters
# Add the cluster labels to the copy of the scaled data
data_scaled_cluster = data_scaled.copy()
data_scaled_cluster['cluster'] = kmeans.labels_

# Relabel the cluster labels
data_scaled_cluster['cluster'] = data_scaled_cluster['cluster'].replace({0: 'SIDD', 1: 'SIRD', 2: 'MARD', 3: 'MOD'})

# Create a new DataFrame with the cluster assignments and variables
data_clustered = pd.concat([data_scaled_cluster['cluster'], 
                            data_scaled_cluster[['bmi', 'dm_age', 'glycohemoglobin', 'homa2b', 'homa2ir']]], axis=1)

# Melt the DataFrame to convert it into long format
data_melted = data_clustered.melt(id_vars='cluster', var_name='Variable', value_name='Value')

# Create the boxplot
plt.figure(figsize=(9.5, 6))  # Adjusted figure size for better layout
sns.boxplot(x='cluster', y='Value', hue='Variable', data=data_melted)
plt.title('Variables by Clusters (1999-2002)')
plt.xlabel('Cluster')
plt.ylabel('Value')
plt.xticks(rotation=45)

# Move the legend to the right of the plot
plt.legend(title='Variable', bbox_to_anchor=(1.01, 1), loc=2, borderaxespad=0.)

plt.tight_layout()  # Adjust the layout to make room for the legend
plt.show()

# Save the plot to a file
plt.savefig(path_nhanes_ckm_folder + '/figures/boxplot_clusters_1999_2002.png', format='png', dpi=300, bbox_inches='tight')
