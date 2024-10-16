

rm(list=ls());gc();source(".Rprofile")

source("data/ncdat_read all variable lists.R")


# For 2001-2002
alb20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/L16_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2001-2002`),]$variable[which(na.omit(alb_variables$`2001-2002`) == .x)], 
              .cols = na.omit(alb_variables$`2001-2002`))

biopro20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/L40_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2001-2002`),]$variable[which(na.omit(biopro_variables$`2001-2002`) == .x)], 
              .cols = na.omit(biopro_variables$`2001-2002`))

bmx20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/BMX_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2001-2002`),]$variable[which(na.omit(bmx_variables$`2001-2002`) == .x)], 
              .cols = na.omit(bmx_variables$`2001-2002`))

bpq20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/BPQ_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2001-2002`),]$variable[which(na.omit(bpq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(bpq_variables$`2001-2002`))

bpx20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/BPX_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2001-2002`),]$variable[which(na.omit(bpxo_variables$`2001-2002`) == .x)], 
              .cols = na.omit(bpxo_variables$`2001-2002`))

cdq20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/CDQ_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2001-2002`),]$variable[which(na.omit(cdq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(cdq_variables$`2001-2002`))

demo20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/DEMO_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2001-2002`),]$variable[which(na.omit(demo_variables$`2001-2002`) == .x)], 
              .cols = na.omit(demo_variables$`2001-2002`))

diq20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/DIQ_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2001-2002`),]$variable[which(na.omit(diq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(diq_variables$`2001-2002`))

fastqx20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/PH_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`2001-2002`),]$variable[which(na.omit(fastqx_variables$`2001-2002`) == .x)], 
              .cols = na.omit(fastqx_variables$`2001-2002`))

ghb20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/L10_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2001-2002`),]$variable[which(na.omit(ghb_variables$`2001-2002`) == .x)], 
              .cols = na.omit(ghb_variables$`2001-2002`))

glu20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/L10AM_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2001-2002`),]$variable[which(na.omit(glu_variables$`2001-2002`) == .x)], 
              .cols = na.omit(glu_variables$`2001-2002`))

hdl20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/L13_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2001-2002`),]$variable[which(na.omit(hdl_variables$`2001-2002`) == .x)], 
              .cols = na.omit(hdl_variables$`2001-2002`))

huq20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/HUQ_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2001-2002`),]$variable[which(na.omit(huq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(huq_variables$`2001-2002`))

ins20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/L10AM_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2001-2002`),]$variable[which(na.omit(ins_variables$`2001-2002`) == .x)], 
              .cols = na.omit(ins_variables$`2001-2002`))

kiq20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/KIQ_U_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2001-2002`),]$variable[which(na.omit(kiq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(kiq_variables$`2001-2002`))

mcq20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/MCQ_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2001-2002`),]$variable[which(na.omit(mcq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(mcq_variables$`2001-2002`))

smq20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/SMQ_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2001-2002`),]$variable[which(na.omit(smq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(smq_variables$`2001-2002`))

smqrtu20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/SMQMEC_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2001-2002`),]$variable[which(na.omit(smqrtu_variables$`2001-2002`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2001-2002`))

trigly20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/L13AM_B.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2001-2002`),]$variable[which(na.omit(trigly_variables$`2001-2002`) == .x)], 
              .cols = na.omit(trigly_variables$`2001-2002`))

dxx20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/dxx_b.XPT")) %>%
  # Select columns
  select(all_of(na.omit(dxx_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ dxx_variables[!is.na(dxx_variables$`2001-2002`),]$variable[which(na.omit(dxx_variables$`2001-2002`) == .x)], 
              .cols = na.omit(dxx_variables$`2001-2002`))

dxx20012002_avg <- dxx20012002 %>%
  group_by(respondentid) %>%
  summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)))

hiq20012002 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2001-2002/hiq_b.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hiq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ hiq_variables[!is.na(hiq_variables$`2001-2002`),]$variable[which(na.omit(hiq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(hiq_variables$`2001-2002`))

# Perform the joins
nhanes_20012002 <- alb20012002 %>%
  left_join(biopro20012002, by = "respondentid") %>%
  left_join(bmx20012002, by = "respondentid") %>%
  left_join(bpq20012002, by = "respondentid") %>%
  left_join(bpx20012002, by = "respondentid") %>%
  left_join(cdq20012002, by = "respondentid") %>%
  left_join(demo20012002, by = "respondentid") %>%
  left_join(diq20012002, by = "respondentid") %>%
  left_join(fastqx20012002, by = "respondentid") %>%
  left_join(ghb20012002, by = "respondentid") %>%
  left_join(glu20012002, by = "respondentid") %>%
  left_join(hdl20012002, by = "respondentid") %>%
  left_join(huq20012002, by = "respondentid") %>%
  left_join(ins20012002, by = "respondentid") %>%
  left_join(kiq20012002, by = "respondentid") %>%
  left_join(mcq20012002, by = "respondentid") %>%
  left_join(smq20012002, by = "respondentid") %>%
  left_join(smqrtu20012002, by = "respondentid") %>%
  left_join(trigly20012002, by = "respondentid") %>%
  left_join(dxx20012002_avg, by = "respondentid") %>%
  left_join(hiq20012002, by = "respondentid")

# Adding eGFR variable according to (https://www.kidney.org/ckd-epi-creatinine-equation-2021):
nhanes_20012002 <- nhanes_20012002 %>%
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

saveRDS(nhanes_20012002, file = paste0(path_nhanes_ckm_cleaned,"/nhanes_20012002.rds"))
