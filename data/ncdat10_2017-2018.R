
rm(list=ls());gc();source(".Rprofile")

source("data/ncdat_read all variable lists.R")

# Repeat for 2017-2018:
alb20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/ALB_CR_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2017-2018`),]$variable[which(na.omit(alb_variables$`2017-2018`) == .x)], 
              .cols = na.omit(alb_variables$`2017-2018`))

biopro20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/BIOPRO_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2017-2018`),]$variable[which(na.omit(biopro_variables$`2017-2018`) == .x)], 
              .cols = na.omit(biopro_variables$`2017-2018`))

bmx20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/BMX_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2017-2018`),]$variable[which(na.omit(bmx_variables$`2017-2018`) == .x)], 
              .cols = na.omit(bmx_variables$`2017-2018`))

bpq20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/BPQ_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2017-2018`),]$variable[which(na.omit(bpq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(bpq_variables$`2017-2018`))

bpx20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/BPX_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2017-2018`),]$variable[which(na.omit(bpxo_variables$`2017-2018`) == .x)], 
              .cols = na.omit(bpxo_variables$`2017-2018`))

cdq20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/CDQ_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2017-2018`),]$variable[which(na.omit(cdq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(cdq_variables$`2017-2018`))

demo20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/DEMO_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2017-2018`),]$variable[which(na.omit(demo_variables$`2017-2018`) == .x)], 
              .cols = na.omit(demo_variables$`2017-2018`))

diq20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/DIQ_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2017-2018`),]$variable[which(na.omit(diq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(diq_variables$`2017-2018`))

fastqx20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/FASTQX_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`2017-2018`),]$variable[which(na.omit(fastqx_variables$`2017-2018`) == .x)], 
              .cols = na.omit(fastqx_variables$`2017-2018`))

ghb20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/GHB_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2017-2018`),]$variable[which(na.omit(ghb_variables$`2017-2018`) == .x)], 
              .cols = na.omit(ghb_variables$`2017-2018`))

glu20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/GLU_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2017-2018`),]$variable[which(na.omit(glu_variables$`2017-2018`) == .x)], 
              .cols = na.omit(glu_variables$`2017-2018`))

hdl20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/HDL_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2017-2018`),]$variable[which(na.omit(hdl_variables$`2017-2018`) == .x)], 
              .cols = na.omit(hdl_variables$`2017-2018`))

hscrp20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/HSCRP_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hscrp_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ hscrp_variables[!is.na(hscrp_variables$`2017-2018`),]$variable[which(na.omit(hscrp_variables$`2017-2018`) == .x)], 
              .cols = na.omit(hscrp_variables$`2017-2018`))

huq20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/HUQ_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2017-2018`),]$variable[which(na.omit(huq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(huq_variables$`2017-2018`))

ins20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/INS_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2017-2018`),]$variable[which(na.omit(ins_variables$`2017-2018`) == .x)], 
              .cols = na.omit(ins_variables$`2017-2018`))

kiq20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/KIQ_U_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2017-2018`),]$variable[which(na.omit(kiq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(kiq_variables$`2017-2018`))

mcq20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/MCQ_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2017-2018`),]$variable[which(na.omit(mcq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(mcq_variables$`2017-2018`))

rxqasa20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/RXQASA_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2017-2018`),]$variable[which(na.omit(rxqasa_variables$`2017-2018`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2017-2018`))

smq20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/SMQ_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2017-2018`),]$variable[which(na.omit(smq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(smq_variables$`2017-2018`))

smqrtu20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/SMQRTU_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2017-2018`),]$variable[which(na.omit(smqrtu_variables$`2017-2018`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2017-2018`))

ssagp20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/SSAGP_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ssagp_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ ssagp_variables[!is.na(ssagp_variables$`2017-2018`),]$variable[which(na.omit(ssagp_variables$`2017-2018`) == .x)], 
              .cols = na.omit(ssagp_variables$`2017-2018`))

tchol20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/TCHOL_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2017-2018`),]$variable[which(na.omit(tchol_variables$`2017-2018`) == .x)], 
              .cols = na.omit(tchol_variables$`2017-2018`))

trigly20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/TRIGLY_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2017-2018`),]$variable[which(na.omit(trigly_variables$`2017-2018`) == .x)], 
              .cols = na.omit(trigly_variables$`2017-2018`))

dxx20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/DXX_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(dxx_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ dxx_variables[!is.na(dxx_variables$`2017-2018`),]$variable[which(na.omit(dxx_variables$`2017-2018`) == .x)], 
              .cols = na.omit(dxx_variables$`2017-2018`))

dxxag20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/DXXAG_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(dxxag_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ dxxag_variables[!is.na(dxxag_variables$`2017-2018`),]$variable[which(na.omit(dxxag_variables$`2017-2018`) == .x)], 
              .cols = na.omit(dxxag_variables$`2017-2018`))

hiq20172018 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-2018/hiq_J.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hiq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ hiq_variables[!is.na(hiq_variables$`2017-2018`),]$variable[which(na.omit(hiq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(hiq_variables$`2017-2018`))

# Perform the joins
nhanes_20172018 <- alb20172018 %>%
  left_join(biopro20172018, by = "respondentid") %>%
  left_join(bmx20172018, by = "respondentid") %>%
  left_join(bpq20172018, by = "respondentid") %>%
  left_join(bpx20172018, by = "respondentid") %>%
  left_join(cdq20172018, by = "respondentid") %>%
  left_join(demo20172018, by = "respondentid") %>%
  left_join(diq20172018, by = "respondentid") %>%
  left_join(fastqx20172018, by = "respondentid") %>%
  left_join(ghb20172018, by = "respondentid") %>%
  left_join(glu20172018, by = "respondentid") %>%
  left_join(hdl20172018, by = "respondentid") %>%
  left_join(hscrp20172018, by = "respondentid") %>%
  left_join(huq20172018, by = "respondentid") %>%
  left_join(ins20172018, by = "respondentid") %>%
  left_join(kiq20172018, by = "respondentid") %>%
  left_join(mcq20172018, by = "respondentid") %>%
  left_join(rxqasa20172018, by = "respondentid") %>%
  left_join(smq20172018, by = "respondentid") %>%
  left_join(smqrtu20172018, by = "respondentid") %>%
  left_join(ssagp20172018, by = "respondentid") %>%
  left_join(tchol20172018, by = "respondentid") %>%
  left_join(trigly20172018, by = "respondentid") %>%
  left_join(dxx20172018, by = "respondentid") %>%
  left_join(hiq20172018, by = "respondentid") %>% 
  left_join(dxxag20172018, by = "respondentid") 

# Adding eGFR variable according to (https://www.kidney.org/ckd-epi-creatinine-equation-2021):
nhanes_20172018 <- nhanes_20172018 %>%
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

saveRDS(nhanes_20172018, file = paste0(path_nhanes_ckm_cleaned,"/nhanes_20172018.rds"))
