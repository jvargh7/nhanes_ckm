
rm(list=ls());gc();source(".Rprofile")

source("data/ncdat_read all variable lists.R")

# For 2007-2008
alb20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/ALB_CR_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2007-2008`),]$variable[which(na.omit(alb_variables$`2007-2008`) == .x)], 
              .cols = na.omit(alb_variables$`2007-2008`))

biopro20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/BIOPRO_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2007-2008`),]$variable[which(na.omit(biopro_variables$`2007-2008`) == .x)], 
              .cols = na.omit(biopro_variables$`2007-2008`))

bmx20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/BMX_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2007-2008`),]$variable[which(na.omit(bmx_variables$`2007-2008`) == .x)], 
              .cols = na.omit(bmx_variables$`2007-2008`))

bpq20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/BPQ_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2007-2008`),]$variable[which(na.omit(bpq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(bpq_variables$`2007-2008`))

bpx20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/BPX_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2007-2008`),]$variable[which(na.omit(bpxo_variables$`2007-2008`) == .x)], 
              .cols = na.omit(bpxo_variables$`2007-2008`))

cdq20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/CDQ_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2007-2008`),]$variable[which(na.omit(cdq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(cdq_variables$`2007-2008`))

demo20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/DEMO_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2007-2008`),]$variable[which(na.omit(demo_variables$`2007-2008`) == .x)], 
              .cols = na.omit(demo_variables$`2007-2008`))

diq20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/DIQ_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2007-2008`),]$variable[which(na.omit(diq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(diq_variables$`2007-2008`))

fastqx20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/FASTQX_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`2007-2008`),]$variable[which(na.omit(fastqx_variables$`2007-2008`) == .x)], 
              .cols = na.omit(fastqx_variables$`2007-2008`))

ghb20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/GHB_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2007-2008`),]$variable[which(na.omit(ghb_variables$`2007-2008`) == .x)], 
              .cols = na.omit(ghb_variables$`2007-2008`))

glu20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/GLU_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2007-2008`),]$variable[which(na.omit(glu_variables$`2007-2008`) == .x)], 
              .cols = na.omit(glu_variables$`2007-2008`))

hdl20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/HDL_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2007-2008`),]$variable[which(na.omit(hdl_variables$`2007-2008`) == .x)], 
              .cols = na.omit(hdl_variables$`2007-2008`))

huq20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/HUQ_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2007-2008`),]$variable[which(na.omit(huq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(huq_variables$`2007-2008`))

ins20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/GLU_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2007-2008`),]$variable[which(na.omit(ins_variables$`2007-2008`) == .x)], 
              .cols = na.omit(ins_variables$`2007-2008`))


kiq20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/KIQ_U_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2007-2008`),]$variable[which(na.omit(kiq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(kiq_variables$`2007-2008`))

mcq20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/MCQ_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2007-2008`),]$variable[which(na.omit(mcq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(mcq_variables$`2007-2008`))

ogtt20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/OGTT_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ogtt_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ ogtt_variables[!is.na(ogtt_variables$`2007-2008`),]$variable[which(na.omit(ogtt_variables$`2007-2008`) == .x)], 
              .cols = na.omit(ogtt_variables$`2007-2008`))

smq20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/SMQ_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2007-2008`),]$variable[which(na.omit(smq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(smq_variables$`2007-2008`))

smqrtu20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/SMQRTU_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2007-2008`),]$variable[which(na.omit(smqrtu_variables$`2007-2008`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2007-2008`))

tchol20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/TCHOL_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2007-2008`),]$variable[which(na.omit(tchol_variables$`2007-2008`) == .x)], 
              .cols = na.omit(tchol_variables$`2007-2008`))

trigly20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/TRIGLY_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2007-2008`),]$variable[which(na.omit(trigly_variables$`2007-2008`) == .x)], 
              .cols = na.omit(trigly_variables$`2007-2008`))

hiq20072008 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2007-2008/hiq_E.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hiq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ hiq_variables[!is.na(hiq_variables$`2007-2008`),]$variable[which(na.omit(hiq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(hiq_variables$`2007-2008`))

# Perform the joins
nhanes_20072008 <- alb20072008 %>%
  left_join(biopro20072008, by = "respondentid") %>%
  left_join(bmx20072008, by = "respondentid") %>%
  left_join(bpq20072008, by = "respondentid") %>%
  left_join(bpx20072008, by = "respondentid") %>%
  left_join(cdq20072008, by = "respondentid") %>%
  left_join(demo20072008, by = "respondentid") %>%
  left_join(diq20072008, by = "respondentid") %>%
  left_join(fastqx20072008, by = "respondentid") %>%
  left_join(ghb20072008, by = "respondentid") %>%
  left_join(glu20072008, by = "respondentid") %>%
  left_join(hdl20072008, by = "respondentid") %>%
  left_join(huq20072008, by = "respondentid") %>%
  left_join(ins20072008, by = "respondentid") %>%
  left_join(kiq20072008, by = "respondentid") %>%
  left_join(mcq20072008, by = "respondentid") %>%
  left_join(ogtt20072008, by = "respondentid") %>%
  left_join(smq20072008, by = "respondentid") %>%
  left_join(smqrtu20072008, by = "respondentid") %>%
  left_join(tchol20072008, by = "respondentid") %>%
  left_join(trigly20072008, by = "respondentid") %>%
  left_join(hiq20072008, by = "respondentid")

# Calculating body fat percentage based on Relative Fat Mass (https://www.nature.com/articles/s41598-018-29362-1):
nhanes_20072008 <- nhanes_20072008 %>%
  dplyr::mutate(fat_percentage = ifelse(gender == 1,
                                 64 - (20 * (height / waistcircumference)),  # RFM for men
                                 76 - (20 * (height / waistcircumference)))) # RFM for women

# Adding eGFR variable according to (https://www.kidney.org/ckd-epi-creatinine-equation-2021):
nhanes_20072008 <- nhanes_20072008 %>%
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


saveRDS(nhanes_20072008, file = paste0(path_nhanes_ckm_cleaned,"/nhanes_20072008.rds"))
