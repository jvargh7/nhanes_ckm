
rm(list=ls());gc();source(".Rprofile")

source("data/nsbdat/nsbdat_read all variable lists.R")

# For 1999-2000
alb19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/LAB16.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`1999-2000`),]$variable[which(na.omit(alb_variables$`1999-2000`) == .x)], 
              .cols = na.omit(alb_variables$`1999-2000`))

biopro19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/LAB18.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`1999-2000`),]$variable[which(na.omit(biopro_variables$`1999-2000`) == .x)], 
              .cols = na.omit(biopro_variables$`1999-2000`))

bmx19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/BMX.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`1999-2000`),]$variable[which(na.omit(bmx_variables$`1999-2000`) == .x)], 
              .cols = na.omit(bmx_variables$`1999-2000`))

bpq19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/BPQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`1999-2000`),]$variable[which(na.omit(bpq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(bpq_variables$`1999-2000`))

bpx19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/BPX.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`1999-2000`),]$variable[which(na.omit(bpxo_variables$`1999-2000`) == .x)], 
              .cols = na.omit(bpxo_variables$`1999-2000`))

cdq19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/CDQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`1999-2000`),]$variable[which(na.omit(cdq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(cdq_variables$`1999-2000`))

demo19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/DEMO.XPT"))%>%
  # Select columns
  select(all_of(na.omit(demo_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`1999-2000`),]$variable[which(na.omit(demo_variables$`1999-2000`) == .x)], 
              .cols = na.omit(demo_variables$`1999-2000`))

diq19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/DIQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`1999-2000`),]$variable[which(na.omit(diq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(diq_variables$`1999-2000`))

fastqx19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/PH.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`1999-2000`),]$variable[which(na.omit(fastqx_variables$`1999-2000`) == .x)], 
              .cols = na.omit(fastqx_variables$`1999-2000`))


ghb19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/LAB10.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`1999-2000`),]$variable[which(na.omit(ghb_variables$`1999-2000`) == .x)], 
              .cols = na.omit(ghb_variables$`1999-2000`))

glu19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/LAB10AM.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`1999-2000`),]$variable[which(na.omit(glu_variables$`1999-2000`) == .x)], 
              .cols = na.omit(glu_variables$`1999-2000`))

hdl19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/LAB13.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`1999-2000`),]$variable[which(na.omit(hdl_variables$`1999-2000`) == .x)], 
              .cols = na.omit(hdl_variables$`1999-2000`))

huq19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/HUQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`1999-2000`),]$variable[which(na.omit(huq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(huq_variables$`1999-2000`))

ins19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/LAB10AM.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`1999-2000`),]$variable[which(na.omit(ins_variables$`1999-2000`) == .x)], 
              .cols = na.omit(ins_variables$`1999-2000`))



kiq19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/KIQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`1999-2000`),]$variable[which(na.omit(kiq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(kiq_variables$`1999-2000`))

mcq19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/MCQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`1999-2000`),]$variable[which(na.omit(mcq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(mcq_variables$`1999-2000`))

smq19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/SMQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`1999-2000`),]$variable[which(na.omit(smq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(smq_variables$`1999-2000`))

smqrtu19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/SMQMEC.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`1999-2000`),]$variable[which(na.omit(smqrtu_variables$`1999-2000`) == .x)], 
              .cols = na.omit(smqrtu_variables$`1999-2000`))

trigly19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/LAB13AM.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`1999-2000`),]$variable[which(na.omit(trigly_variables$`1999-2000`) == .x)], 
              .cols = na.omit(trigly_variables$`1999-2000`))

dxx19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/dxx.XPT")) %>%
  # Select columns
  select(all_of(na.omit(dxx_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ dxx_variables[!is.na(dxx_variables$`1999-2000`),]$variable[which(na.omit(dxx_variables$`1999-2000`) == .x)], 
              .cols = na.omit(dxx_variables$`1999-2000`))

dxx19992000_avg <- dxx19992000 %>%
  group_by(respondentid) %>%
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)))

hiq19992000 <- read_xpt(paste0(path_nhanes_nsb_raw,"/1999-2000/hiq.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hiq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ hiq_variables[!is.na(hiq_variables$`1999-2000`),]$variable[which(na.omit(hiq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(hiq_variables$`1999-2000`))

# Perform the joins
nhanes_19992000 <- alb19992000 %>%
  left_join(biopro19992000, by = "respondentid") %>%
  left_join(bmx19992000, by = "respondentid") %>%
  left_join(bpq19992000, by = "respondentid") %>%
  left_join(bpx19992000, by = "respondentid") %>%
  left_join(cdq19992000, by = "respondentid") %>%
  left_join(demo19992000, by = "respondentid") %>%
  left_join(diq19992000, by = "respondentid") %>%
  left_join(fastqx19992000, by = "respondentid") %>%
  left_join(ghb19992000, by = "respondentid") %>%
  left_join(glu19992000, by = "respondentid") %>%
  left_join(hdl19992000, by = "respondentid") %>%
  left_join(huq19992000, by = "respondentid") %>%
  left_join(ins19992000, by = "respondentid") %>%
  left_join(kiq19992000, by = "respondentid") %>%
  left_join(mcq19992000, by = "respondentid") %>%
  left_join(smq19992000, by = "respondentid") %>%
  left_join(smqrtu19992000, by = "respondentid") %>%
  left_join(trigly19992000, by = "respondentid") %>%
  left_join(dxx19992000_avg, by = "respondentid") %>%
  left_join(hiq19992000, by = "respondentid")

# Adding eGFR variable according to (https://www.kidney.org/ckd-epi-creatinine-equation-2021):
nhanes_19992000 <- nhanes_19992000 %>%
  dplyr::mutate(
    # CKD-EPI equation for males
    eGFR = case_when(
      gender == 1 & serum_creatinine <= 0.9 ~ 141 * (serum_creatinine / 0.9)^(-0.411) * (0.993^age) * ifelse(race == 4, 1.159, 1),
      gender == 1 & serum_creatinine > 0.9 ~ 141 * (serum_creatinine / 0.9)^(-1.209) * (0.993^age) * ifelse(race == 4, 1.159, 1),
      
      # CKD-EPI equation for females
      gender == 2 & serum_creatinine <= 0.7 ~ 144 * (serum_creatinine / 0.7)^(-0.329) * (0.993^age) * ifelse(race == 4, 1.159, 1),
      gender == 2 & serum_creatinine > 0.7 ~ 144 * (serum_creatinine / 0.7)^(-1.209) * (0.993^age) * ifelse(race == 4, 1.159, 1)
    )
  )

# Saving the combined NHANES data sets as RDS files:
saveRDS(nhanes_19992000, file = paste0(path_nhanes_nsb_cleaned,"/nhanes_19992000.rds"))

rm(list = ls())
