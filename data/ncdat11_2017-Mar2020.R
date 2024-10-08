
rm(list=ls());gc();source(".Rprofile")

source("data/ncdat_read all variable lists.R")


# Loading in the 2017-Mar2020 datasets:
alb2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_ALB_CR.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2017-Mar2020`),]$variable[which(na.omit(alb_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(alb_variables$`2017-Mar2020`))

biopro2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_BIOPRO.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2017-Mar2020`),]$variable[which(na.omit(biopro_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(biopro_variables$`2017-Mar2020`))

bmx2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_BMX.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2017-Mar2020`),]$variable[which(na.omit(bmx_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(bmx_variables$`2017-Mar2020`))

bpq2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_BPQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2017-Mar2020`),]$variable[which(na.omit(bpq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(bpq_variables$`2017-Mar2020`))

bpxo2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_BPXO.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2017-Mar2020`),]$variable[which(na.omit(bpxo_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(bpxo_variables$`2017-Mar2020`))

cdq2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_CDQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2017-Mar2020`),]$variable[which(na.omit(cdq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(cdq_variables$`2017-Mar2020`))

demo2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_DEMO.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2017-Mar2020`),]$variable[which(na.omit(demo_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(demo_variables$`2017-Mar2020`))

diq2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_DIQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2017-Mar2020`),]$variable[which(na.omit(diq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(diq_variables$`2017-Mar2020`))

fastqx2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_FASTQX.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`2017-Mar2020`),]$variable[which(na.omit(fastqx_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(fastqx_variables$`2017-Mar2020`))

ghb2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_GHB.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2017-Mar2020`),]$variable[which(na.omit(ghb_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(ghb_variables$`2017-Mar2020`))

glu2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_GLU.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2017-Mar2020`),]$variable[which(na.omit(glu_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(glu_variables$`2017-Mar2020`))

hdl2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_HDL.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2017-Mar2020`),]$variable[which(na.omit(hdl_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(hdl_variables$`2017-Mar2020`))

hscrp2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_HSCRP.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hscrp_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ hscrp_variables[!is.na(hscrp_variables$`2017-Mar2020`),]$variable[which(na.omit(hscrp_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(hscrp_variables$`2017-Mar2020`))

huq2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_HUQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2017-Mar2020`),]$variable[which(na.omit(huq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(huq_variables$`2017-Mar2020`))

inq2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_INQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(inq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ inq_variables[!is.na(inq_variables$`2017-Mar2020`),]$variable[which(na.omit(inq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(inq_variables$`2017-Mar2020`))

ins2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_INS.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2017-Mar2020`),]$variable[which(na.omit(ins_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(ins_variables$`2017-Mar2020`))

kiq2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_KIQ_U.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2017-Mar2020`),]$variable[which(na.omit(kiq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(kiq_variables$`2017-Mar2020`))

mcq2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_MCQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2017-Mar2020`),]$variable[which(na.omit(mcq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(mcq_variables$`2017-Mar2020`))

rxqasa2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_RXQASA.XPT")) %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2017-Mar2020`),]$variable[which(na.omit(rxqasa_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2017-Mar2020`))

smq2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_SMQ.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2017-Mar2020`),]$variable[which(na.omit(smq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(smq_variables$`2017-Mar2020`))

smqrtu2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_SMQRTU.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2017-Mar2020`),]$variable[which(na.omit(smqrtu_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2017-Mar2020`))

ssagp2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_SSAGP.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ssagp_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ ssagp_variables[!is.na(ssagp_variables$`2017-Mar2020`),]$variable[which(na.omit(ssagp_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(ssagp_variables$`2017-Mar2020`))

tchol2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_TCHOL.XPT")) %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2017-Mar2020`),]$variable[which(na.omit(tchol_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(tchol_variables$`2017-Mar2020`))

trigly2017Mar2020 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2017-Mar2020/P_TRIGLY.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2017-Mar2020`),]$variable[which(na.omit(trigly_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(trigly_variables$`2017-Mar2020`))

# Perform the joins
nhanes_2017Mar2020 <- alb2017Mar2020 %>%
  left_join(biopro2017Mar2020, by = "respondentid") %>%
  left_join(bmx2017Mar2020, by = "respondentid") %>%
  left_join(bpq2017Mar2020, by = "respondentid") %>%
  left_join(bpxo2017Mar2020, by = "respondentid") %>%
  left_join(cdq2017Mar2020, by = "respondentid") %>%
  left_join(demo2017Mar2020, by = "respondentid") %>%
  left_join(diq2017Mar2020, by = "respondentid") %>%
  left_join(fastqx2017Mar2020, by = "respondentid") %>%
  left_join(ghb2017Mar2020, by = "respondentid") %>%
  left_join(glu2017Mar2020, by = "respondentid") %>%
  left_join(hdl2017Mar2020, by = "respondentid") %>%
  left_join(hscrp2017Mar2020, by = "respondentid") %>%
  left_join(huq2017Mar2020, by = "respondentid") %>%
  left_join(inq2017Mar2020, by = "respondentid") %>%
  left_join(ins2017Mar2020, by = "respondentid") %>%
  left_join(kiq2017Mar2020, by = "respondentid") %>%
  left_join(mcq2017Mar2020, by = "respondentid") %>%
  left_join(rxqasa2017Mar2020, by = "respondentid") %>%
  left_join(smq2017Mar2020, by = "respondentid") %>%
  left_join(smqrtu2017Mar2020, by = "respondentid") %>%
  left_join(ssagp2017Mar2020, by = "respondentid") %>%
  left_join(tchol2017Mar2020, by = "respondentid") %>%
  left_join(trigly2017Mar2020, by = "respondentid")

saveRDS(nhanes_2017Mar2020, file = paste0(path_nhanes_ckm_cleaned,"/nhanes_2017Mar2020.rds"))

rm(list = ls())
