import numpy as np
import pandas as pd
from sklearn.impute import KNNImputer
import os


if os.getlogin() == "JVARGH7":
    path_diabetes_subphenotypes_youth_folder = "C:/Cloud/OneDrive - Emory University/Papers/Subphenotypes in Youth-onset T2DM"
elif os.getlogin() == 'JGUO258':
    path_diabetes_subphenotypes_youth_folder = "C:/Users/JGUO258/OneDrive - Emory/Subphenotypes in Youth-onset T2DM"
elif os.getlogin() == 'krishnasanaka':
    path_nhanes_ckm_folder = "/Users/krishnasanaka/Library/CloudStorage/OneDrive-Emory/NHANES CKM Cascade"
elif os.getlogin() == 'root':
    path_nhanes_ckm_folder = "/Users/krishnasanaka/Library/CloudStorage/OneDrive-Emory/NHANES CKM Cascade"

data_mi = pd.read_csv(path_nhanes_ckm_folder + '/working/new diabetes/newdm_data.csv')

#select variables 
selected_variables = ["respondentid", "dm_age", "bmi", "glycohemoglobin", "HOMA2 %B", "HOMA2 IR", 
                      "hdl", "ldl", "triglyceride", "alt", "ast", "sbp", "dbp", "egfr", "waistcircumference",
                      "fat_percentage", "age", "gender", "race", "hhincome", "psu", "pseudostratum",
                      "intweight", "mec2yweight", "mec4yweight", "dm_doc_told", "insured", "insured_private",
                      "insured_medicare", "insured_medicaid", "year", "fasting_glucose", "fasting_mec_weight",
                      "insulin_level", "smoke_currently", "smoke_history"]

#drop missing values in the selected variables
data_mi = data_mi[selected_variables]
data_mi.shape

############### Do KNN Imputation with K = 4 by Study Sites #####################
columns_to_impute = ["bmi","dm_age","glycohemoglobin","HOMA2 %B","HOMA2 IR"]

# Function to impute data for one study site
def impute_data(data, n_neighbors=4):
    imputer = KNNImputer(n_neighbors=n_neighbors)
    data[columns_to_impute] = imputer.fit_transform(data[columns_to_impute])
    return data

# Impute data for the entire dataset
imputed_data = impute_data(data_mi)

# Check if there are any missing values
print(imputed_data.isnull().sum())
print(data_mi.isnull().sum())
# compare the imputed data with the original data
data_mi.describe()
imputed_data.describe()

# save the imputed data
imputed_data.to_csv(path_nhanes_ckm_folder + '/working/new diabetes/knn imputation.csv', index=False)
