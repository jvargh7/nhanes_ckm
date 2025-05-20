import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import adjusted_rand_score

# Load the data
path = '/Users/krishnasanaka/Library/CloudStorage/OneDrive-Emory/NHANES CKM Cascade/working/new diabetes/knn clusters.csv'
analytic_dataset = pd.read_csv(path)

# Select variables
selected_variables = ['study_id', 'bmi', 'hba1c', 'dmagediag', 'homa2b', 'homa2ir', 'tgl', 'ldlc', 'ratio_th', 'sbp', 'dbp', 'hdlc', 'study', 'race', 'female']

# Drop missing values in the selected variables
analytic_dataset = analytic_dataset[selected_variables]
analytic_dataset = analytic_dataset.dropna()

study_sites = analytic_dataset['study'].unique()

# Standardize the entire dataset
scaler = StandardScaler()
var_5 = ['bmi', 'hba1c', 'dmagediag', 'homa2b', 'homa2ir']
cluster_v5 = scaler.fit_transform(analytic_dataset[var_5])

# Perform KMeans clustering on the entire dataset
kmeans = KMeans(init="random", n_clusters=4, n_init=10, max_iter=300, random_state=57)
kmeans.fit(cluster_v5)
original_labels = kmeans.labels_

# Leave-one-out analysis
results = []

for study_site in study_sites:
    # Exclude the current study site from the dataset
    excluded_dataset = analytic_dataset[analytic_dataset['study'] != study_site]
    excluded_sample_size = len(analytic_dataset[analytic_dataset['study'] == study_site])
    
    # Standardize the excluded dataset
    excluded_cluster_v5 = scaler.fit_transform(excluded_dataset[var_5])
    
    # Perform KMeans clustering on the excluded dataset
    kmeans_excluded = KMeans(init="random", n_clusters=4, n_init=10, max_iter=300, random_state=57)
    kmeans_excluded.fit(excluded_cluster_v5)
    excluded_labels = kmeans_excluded.labels_

    # Adjust original_labels to exclude the study site
    original_labels_excluded = original_labels[analytic_dataset['study'] != study_site]

    # Calculate Adjusted Rand Index (ARI)
    ARI = adjusted_rand_score(original_labels_excluded, excluded_labels)

    # Append the results
    results.append({'Study Site Removed': study_site, 'Sample Size': excluded_sample_size, 'ARI': ARI})

# Convert results to DataFrame
results_df = pd.DataFrame(results)

# Define the desired order
results_df['Study Site Removed'] = pd.Categorical(results_df['Study Site Removed'])
results_df = results_df.sort_values('Study Site Removed')

# Print the results
print(results_df)
# Save results to a CSV file
results_df.to_csv('/Users/zhongyuli/Library/CloudStorage/OneDrive-EmoryUniversity/Diabetes Endotypes Project (JV and ZL)/working/processed/dec_an10a_sensitivity_analysis_results_ari_clean.csv', index=False)
