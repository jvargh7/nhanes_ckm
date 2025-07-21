rm(list=ls()); gc(); source(".Rprofile")

# Load in data set
source("analysis/ncan_analytic sample for survival.R")

# Function to calculate median (25th, 75th) summary
summarize_median_iqr <- function(x) {
  q <- quantile(x, probs = c(0.25, 0.5, 0.75), na.rm = TRUE)
  return(data.frame(Median = q[2], P25 = q[1], P75 = q[3]))
}

### ALL-CAUSE MORTALITY
# 1. Median follow-up time (all participants)
all_cause_followup <- analytic_sample_with_not2d %>%
  group_by(cluster) %>%
  group_modify(~ summarize_median_iqr(.x$permth_int)) %>%
  mutate(Event = "All-cause", Metric = "Follow-up time")

# 2. Median time to event (only among all-cause deaths)
all_cause_event <- analytic_sample_with_not2d %>%
  dplyr::filter(mortstat == 1) %>%
  group_by(cluster) %>%
  group_modify(~ summarize_median_iqr(.x$permth_int)) %>%
  mutate(Event = "All-cause", Metric = "Time to event")


### CAUSE-SPECIFIC MORTALITY

# 3. Heart-specific mortality
cs_heart_followup <- analytic_sample_with_not2d %>%
  group_by(cluster) %>%
  group_modify(~ summarize_median_iqr(.x$permth_int)) %>%
  mutate(Event = "Heart", Metric = "Follow-up time")

cs_heart_event <- analytic_sample_with_not2d %>%
  dplyr::filter(mortality_heart == 1) %>%
  group_by(cluster) %>%
  group_modify(~ summarize_median_iqr(.x$permth_int)) %>%
  mutate(Event = "Heart", Metric = "Time to event")

# 4. Malignant neoplasm mortality
cs_malig_followup <- analytic_sample_with_not2d %>%
  group_by(cluster) %>%
  group_modify(~ summarize_median_iqr(.x$permth_int)) %>%
  mutate(Event = "Malignancy", Metric = "Follow-up time")

cs_malig_event <- analytic_sample_with_not2d %>%
  dplyr::filter(mortality_malignant_neoplasms == 1) %>%
  group_by(cluster) %>%
  group_modify(~ summarize_median_iqr(.x$permth_int)) %>%
  mutate(Event = "Malignancy", Metric = "Time to event")

# 5. Other-cause mortality
cs_other_followup <- analytic_sample_with_not2d %>%
  group_by(cluster) %>%
  group_modify(~ summarize_median_iqr(.x$permth_int)) %>%
  mutate(Event = "Other", Metric = "Follow-up time")

cs_other_event <- analytic_sample_with_not2d %>%
  dplyr::filter(mortality_any_other == 1) %>%
  group_by(cluster) %>%
  group_modify(~ summarize_median_iqr(.x$permth_int)) %>%
  mutate(Event = "Other", Metric = "Time to event")


### Combine all results
result <- bind_rows(
  all_cause_followup,
  all_cause_event,
  cs_heart_followup,
  cs_heart_event,
  cs_malig_followup,
  cs_malig_event,
  cs_other_followup,
  cs_other_event
) %>%
  select(Event, Metric, Cluster = cluster, Median, P25, P75) %>%
  mutate(`Median (25th, 75th)` = sprintf("%.1f (%.1f, %.1f)", Median, P25, P75)) %>%
  select(Event, Metric, Cluster, `Median (25th, 75th)`) %>%
  arrange(Event, Metric, Cluster)

# View result
print(result)

# Save results
write.csv(result, "paper/table_median followup and event times by cluster.csv", row.names = FALSE)
