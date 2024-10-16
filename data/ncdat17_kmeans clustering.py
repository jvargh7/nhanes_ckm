# The purpose of this python file is to run k means on five variables: age of diagnosis, bmi, HbA1c, fasting insulin, and fasting glucose
# load libraries
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

if os.getlogin()=="JVARGH7":
    path_diabetes_subphenotypes_youth_folder = "C:/Cloud/OneDrive - Emory University/Papers/Subphenotypes in Youth-onset T2DM"
if os.getlogin()=='JGUO258':
    path_diabetes_subphenotypes_youth_folder = "C:/Users/JGUO258/OneDrive - Emory/Subphenotypes in Youth-onset T2DM"
elif os.getlogin() == 'krishnasanaka':
    path_nhanes_ckm_folder = "/Users/krishnasanaka/Library/CloudStorage/OneDrive-Emory/NHANES CKM Cascade"
elif os.getlogin() == 'root':
    path_nhanes_ckm_folder = "/Users/krishnasanaka/Library/CloudStorage/OneDrive-Emory/NHANES CKM Cascade"

# Load the dataset
analytic_dataset = pd.read_csv(path_nhanes_ckm_folder + '/working/new diabetes/knn imputation.csv') 

#----------------------------------------------------------------------------------------------------------------------------------
# cluster variables: "bmi","dm_age","glycohemoglobin","HOMA2 %B","HOMA2 IR"

# List of columns to keep
columns_to_keep = ['dm_age', 'bmi', 'glycohemoglobin', 'HOMA2 %B', 'HOMA2 IR', 'ldl', 'hdl', 'triglyceride', 'alt', 'ast', 'sbp', 'dbp', 'eGFR', 'waistcircumference']

# Select only the columns you want to keep
analytic_dataset_cluster = analytic_dataset[columns_to_keep].copy()

# Capture the columns that were not used for clustering
other_vars = analytic_dataset.drop(columns=columns_to_keep)

# Standardize the data
scaler = StandardScaler()
data_scaled = scaler.fit_transform(analytic_dataset[['bmi','dm_age','glycohemoglobin','HOMA2 %B','HOMA2 IR']])

data_scaled = pd.DataFrame(data_scaled, columns=['bmi','dm_age','glycohemoglobin','HOMA2 %B','HOMA2 IR'])

# Perform KMeans clustering
kmeans = KMeans(init="random", n_clusters=4, n_init=10, max_iter=300, random_state=57)
kmeans.fit(data_scaled)

# Add cluster labels to the original dataset with selected columns
analytic_dataset_cluster['cluster'] = kmeans.labels_

# Relabel the cluster labels based on clinical characteristics
analytic_dataset_cluster['cluster'] = analytic_dataset_cluster['cluster'].replace({0:'ySIRD', 1:'yMARD', 2:'ySIDD', 3:'yMOD'})

# Concatenate the other variables back to the dataset
analytic_dataset_cluster = pd.concat([analytic_dataset_cluster, other_vars], axis=1)

# Check the final counts for each cluster
analytic_dataset_cluster['cluster'].value_counts()

# Save the dataset with the cluster labels
analytic_dataset_cluster.to_csv(path_nhanes_ckm_folder + '/working/new diabetes/knn clusters.csv', index=False)

#----------------------------------------------------------------------------------------------------------------------------------------------
# Plot the clusters
# Add the cluster labels to the copy of the scaled data

data_scaled_cluster = data_scaled.copy()
data_scaled_cluster['cluster'] = kmeans.labels_

# Relabel the cluster labels
data_scaled_cluster['cluster'] = data_scaled_cluster['cluster'].replace({0:'ySIRD', 1:'yMARD', 2:'ySIDD', 3:'yMOD'})

# Create a new DataFrame with the cluster assignments and variables
data_clustered = pd.concat([data_scaled_cluster['cluster'], data_scaled_cluster[['bmi','dm_age','glycohemoglobin','HOMA2 %B','HOMA2 IR']]], axis=1)

# Melt the DataFrame to convert it into long format
data_melted = data_clustered.melt(id_vars='cluster', var_name='Variable', value_name='Value')

# Create the boxplot
plt.figure(figsize=(9.5, 6))  # Adjusted figure size for better layout
sns.boxplot(x='cluster', y='Value', hue='Variable', data=data_melted)
plt.title('Variables by Clusters')
plt.xlabel('Cluster')
plt.ylabel('Value')
plt.xticks(rotation=45)

# Move the legend to the right of the plot
plt.legend(title='Variable', bbox_to_anchor=(1.01, 1), loc=2, borderaxespad=0.)

plt.tight_layout()  # Adjust the layout to make room for the legend
plt.show()

# Save the plot to a file
plt.savefig(path_nhanes_ckm_folder + '/figures/boxplot_clusters.png', format='png', dpi=300, bbox_inches='tight')
