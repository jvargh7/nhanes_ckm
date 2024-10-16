

rm(list=ls());gc();source(".Rprofile")

source("data/ncdat_read all variable lists.R")

# For 2003-2004
alb20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/L16_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2003-2004`),]$variable[which(na.omit(alb_variables$`2003-2004`) == .x)], 
              .cols = na.omit(alb_variables$`2003-2004`))

biopro20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/L40_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2003-2004`),]$variable[which(na.omit(biopro_variables$`2003-2004`) == .x)], 
              .cols = na.omit(biopro_variables$`2003-2004`))

bmx20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/BMX_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2003-2004`),]$variable[which(na.omit(bmx_variables$`2003-2004`) == .x)], 
              .cols = na.omit(bmx_variables$`2003-2004`))

bpq20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/BPQ_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2003-2004`),]$variable[which(na.omit(bpq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(bpq_variables$`2003-2004`))

bpx20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/BPX_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2003-2004`),]$variable[which(na.omit(bpxo_variables$`2003-2004`) == .x)], 
              .cols = na.omit(bpxo_variables$`2003-2004`))

cdq20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/CDQ_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2003-2004`),]$variable[which(na.omit(cdq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(cdq_variables$`2003-2004`))

demo20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/DEMO_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2003-2004`),]$variable[which(na.omit(demo_variables$`2003-2004`) == .x)], 
              .cols = na.omit(demo_variables$`2003-2004`))

diq20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/DIQ_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2003-2004`),]$variable[which(na.omit(diq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(diq_variables$`2003-2004`))

fastqx20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/PH_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`2003-2004`),]$variable[which(na.omit(fastqx_variables$`2003-2004`) == .x)], 
              .cols = na.omit(fastqx_variables$`2003-2004`))

ghb20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/L10_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2003-2004`),]$variable[which(na.omit(ghb_variables$`2003-2004`) == .x)], 
              .cols = na.omit(ghb_variables$`2003-2004`))

glu20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/L10AM_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2003-2004`),]$variable[which(na.omit(glu_variables$`2003-2004`) == .x)], 
              .cols = na.omit(glu_variables$`2003-2004`))

hdl20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/L13_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2003-2004`),]$variable[which(na.omit(hdl_variables$`2003-2004`) == .x)], 
              .cols = na.omit(hdl_variables$`2003-2004`))

huq20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/HUQ_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2003-2004`),]$variable[which(na.omit(huq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(huq_variables$`2003-2004`))

ins20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/L10AM_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2003-2004`),]$variable[which(na.omit(ins_variables$`2003-2004`) == .x)], 
              .cols = na.omit(ins_variables$`2003-2004`))


kiq20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/KIQ_U_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2003-2004`),]$variable[which(na.omit(kiq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(kiq_variables$`2003-2004`))

mcq20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/MCQ_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2003-2004`),]$variable[which(na.omit(mcq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(mcq_variables$`2003-2004`))

smq20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/SMQ_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2003-2004`),]$variable[which(na.omit(smq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(smq_variables$`2003-2004`))

smqrtu20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/SMQMEC_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2003-2004`),]$variable[which(na.omit(smqrtu_variables$`2003-2004`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2003-2004`))

trigly20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/L13AM_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2003-2004`),]$variable[which(na.omit(trigly_variables$`2003-2004`) == .x)], 
              .cols = na.omit(trigly_variables$`2003-2004`))

dxx20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/dxx_C.XPT")) %>%
  # Select columns
  select(all_of(na.omit(dxx_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ dxx_variables[!is.na(dxx_variables$`2003-2004`),]$variable[which(na.omit(dxx_variables$`2003-2004`) == .x)], 
              .cols = na.omit(dxx_variables$`2003-2004`))

dxx20032004_avg <- dxx20032004 %>%
  group_by(respondentid) %>%
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)))

hiq20032004 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2003-2004/hiq_c.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hiq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ hiq_variables[!is.na(hiq_variables$`2003-2004`),]$variable[which(na.omit(hiq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(hiq_variables$`2003-2004`))

# Perform the joins
nhanes_20032004 <- alb20032004 %>%
  left_join(biopro20032004, by = "respondentid") %>%
  left_join(bmx20032004, by = "respondentid") %>%
  left_join(bpq20032004, by = "respondentid") %>%
  left_join(bpx20032004, by = "respondentid") %>%
  left_join(cdq20032004, by = "respondentid") %>%
  left_join(demo20032004, by = "respondentid") %>%
  left_join(diq20032004, by = "respondentid") %>%
  left_join(fastqx20032004, by = "respondentid") %>%
  left_join(ghb20032004, by = "respondentid") %>%
  left_join(glu20032004, by = "respondentid") %>%
  left_join(hdl20032004, by = "respondentid") %>%
  left_join(huq20032004, by = "respondentid") %>%
  left_join(ins20032004, by = "respondentid") %>%
  left_join(kiq20032004, by = "respondentid") %>%
  left_join(mcq20032004, by = "respondentid") %>%
  left_join(smq20032004, by = "respondentid") %>%
  left_join(smqrtu20032004, by = "respondentid") %>%
  left_join(trigly20032004, by = "respondentid") %>%
  left_join(dxx20032004_avg, by = "respondentid") %>%
  left_join(hiq20032004, by = "respondentid")

# Adding eGFR variable according to (https://www.kidney.org/ckd-epi-creatinine-equation-2021):
nhanes_20032004 <- nhanes_20032004 %>%
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

saveRDS(nhanes_20032004, file = paste0(path_nhanes_ckm_cleaned,"/nhanes_20032004.rds"))
