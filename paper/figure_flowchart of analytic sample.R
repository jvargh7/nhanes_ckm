rm(list=ls()); gc(); source(".Rprofile")

# Loading the old datasets:
source("data/ncdat14_newly diagnosed dm.R")

# Creating a simple formula to find the number of each gender:
generate_gender_counts <- function(data_frame) {
  table(data_frame$gender)
}

# Applying the formula:
table1 <- generate_gender_counts(combined_nhanes_over18)
table2 <- generate_gender_counts(new_or_undiagnosed_dm)
table3 <- generate_gender_counts(newdm_data)

# Viewing the counts:
view(table1)
view(table2)
view(table3)