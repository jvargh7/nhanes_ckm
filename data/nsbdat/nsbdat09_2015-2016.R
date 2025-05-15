
rm(list=ls());gc();source(".Rprofile")

source("data/nsbdat/nsbdat_read all variable lists.R")

# For 2015-2016:
alb20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/ALB_CR_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2015-2016`),]$variable[which(na.omit(alb_variables$`2015-2016`) == .x)], 
              .cols = na.omit(alb_variables$`2015-2016`))

biopro20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/BIOPRO_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2015-2016`),]$variable[which(na.omit(biopro_variables$`2015-2016`) == .x)], 
              .cols = na.omit(biopro_variables$`2015-2016`))

bmx20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/BMX_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2015-2016`),]$variable[which(na.omit(bmx_variables$`2015-2016`) == .x)], 
              .cols = na.omit(bmx_variables$`2015-2016`))

bpq20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/BPQ_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2015-2016`),]$variable[which(na.omit(bpq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(bpq_variables$`2015-2016`))

bpx20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/BPX_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2015-2016`),]$variable[which(na.omit(bpxo_variables$`2015-2016`) == .x)], 
              .cols = na.omit(bpxo_variables$`2015-2016`))

cdq20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/CDQ_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2015-2016`),]$variable[which(na.omit(cdq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(cdq_variables$`2015-2016`))

demo20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/DEMO_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2015-2016`),]$variable[which(na.omit(demo_variables$`2015-2016`) == .x)], 
              .cols = na.omit(demo_variables$`2015-2016`))

diq20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/DIQ_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2015-2016`),]$variable[which(na.omit(diq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(diq_variables$`2015-2016`))

fastqx20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/FASTQX_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`2015-2016`),]$variable[which(na.omit(fastqx_variables$`2015-2016`) == .x)], 
              .cols = na.omit(fastqx_variables$`2015-2016`))

ghb20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/GHB_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2015-2016`),]$variable[which(na.omit(ghb_variables$`2015-2016`) == .x)], 
              .cols = na.omit(ghb_variables$`2015-2016`))

glu20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/GLU_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2015-2016`),]$variable[which(na.omit(glu_variables$`2015-2016`) == .x)], 
              .cols = na.omit(glu_variables$`2015-2016`))

hdl20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/HDL_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2015-2016`),]$variable[which(na.omit(hdl_variables$`2015-2016`) == .x)], 
              .cols = na.omit(hdl_variables$`2015-2016`))

hscrp20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/HSCRP_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hscrp_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ hscrp_variables[!is.na(hscrp_variables$`2015-2016`),]$variable[which(na.omit(hscrp_variables$`2015-2016`) == .x)], 
              .cols = na.omit(hscrp_variables$`2015-2016`))

huq20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/HUQ_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2015-2016`),]$variable[which(na.omit(huq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(huq_variables$`2015-2016`))

ins20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/INS_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2015-2016`),]$variable[which(na.omit(ins_variables$`2015-2016`) == .x)], 
              .cols = na.omit(ins_variables$`2015-2016`))

kiq20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/KIQ_U_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2015-2016`),]$variable[which(na.omit(kiq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(kiq_variables$`2015-2016`))

mcq20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/MCQ_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2015-2016`),]$variable[which(na.omit(mcq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(mcq_variables$`2015-2016`))

ogtt20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/OGTT_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ogtt_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ ogtt_variables[!is.na(ogtt_variables$`2015-2016`),]$variable[which(na.omit(ogtt_variables$`2015-2016`) == .x)], 
              .cols = na.omit(ogtt_variables$`2015-2016`))

rxqasa20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/RXQASA_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2015-2016`),]$variable[which(na.omit(rxqasa_variables$`2015-2016`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2015-2016`))

smq20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/SMQ_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2015-2016`),]$variable[which(na.omit(smq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(smq_variables$`2015-2016`))

smqrtu20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/SMQRTU_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2015-2016`),]$variable[which(na.omit(smqrtu_variables$`2015-2016`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2015-2016`))

ssagp20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/SSAGP_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ssagp_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ ssagp_variables[!is.na(ssagp_variables$`2015-2016`),]$variable[which(na.omit(ssagp_variables$`2015-2016`) == .x)], 
              .cols = na.omit(ssagp_variables$`2015-2016`))

tchol20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/TCHOL_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2015-2016`),]$variable[which(na.omit(tchol_variables$`2015-2016`) == .x)], 
              .cols = na.omit(tchol_variables$`2015-2016`))

trigly20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/TRIGLY_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2015-2016`),]$variable[which(na.omit(trigly_variables$`2015-2016`) == .x)], 
              .cols = na.omit(trigly_variables$`2015-2016`))

dxx20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/DXX_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(dxx_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ dxx_variables[!is.na(dxx_variables$`2015-2016`),]$variable[which(na.omit(dxx_variables$`2015-2016`) == .x)], 
              .cols = na.omit(dxx_variables$`2015-2016`))

hiq20152016 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2015-2016/hiq_I.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hiq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ hiq_variables[!is.na(hiq_variables$`2015-2016`),]$variable[which(na.omit(hiq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(hiq_variables$`2015-2016`))

# Perform the joins
nhanes_20152016 <- alb20152016 %>%
  left_join(biopro20152016, by = "respondentid") %>%
  left_join(bmx20152016, by = "respondentid") %>%
  left_join(bpq20152016, by = "respondentid") %>%
  left_join(bpx20152016, by = "respondentid") %>%
  left_join(cdq20152016, by = "respondentid") %>%
  left_join(demo20152016, by = "respondentid") %>%
  left_join(diq20152016, by = "respondentid") %>%
  left_join(fastqx20152016, by = "respondentid") %>%
  left_join(ghb20152016, by = "respondentid") %>%
  left_join(glu20152016, by = "respondentid") %>%
  left_join(hdl20152016, by = "respondentid") %>%
  left_join(hscrp20152016, by = "respondentid") %>%
  left_join(huq20152016, by = "respondentid") %>%
  left_join(ins20152016, by = "respondentid") %>%
  left_join(kiq20152016, by = "respondentid") %>%
  left_join(mcq20152016, by = "respondentid") %>%
  left_join(ogtt20152016, by = "respondentid") %>%
  left_join(rxqasa20152016, by = "respondentid") %>%
  left_join(smq20152016, by = "respondentid") %>%
  left_join(smqrtu20152016, by = "respondentid") %>%
  left_join(ssagp20152016, by = "respondentid") %>%
  left_join(tchol20152016, by = "respondentid") %>%
  left_join(trigly20152016, by = "respondentid") %>%
  left_join(dxx20152016, by = "respondentid") %>%
  left_join(hiq20152016, by = "respondentid")

# Adding eGFR variable according to (https://www.kidney.org/ckd-epi-creatinine-equation-2021):
nhanes_20152016 <- nhanes_20152016 %>%
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

saveRDS(nhanes_20152016, file = paste0(path_nhanes_nsb_cleaned,"/nhanes_20152016.rds"))
