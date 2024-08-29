
rm(list=ls());gc();source(".Rprofile")

source("data/ncdat_read all variable lists.R")


# For 2013-2014
alb20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/ALB_CR_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2013-2014`),]$variable[which(na.omit(alb_variables$`2013-2014`) == .x)], 
              .cols = na.omit(alb_variables$`2013-2014`))

biopro20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/BIOPRO_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2013-2014`),]$variable[which(na.omit(biopro_variables$`2013-2014`) == .x)], 
              .cols = na.omit(biopro_variables$`2013-2014`))

bmx20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/BMX_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2013-2014`),]$variable[which(na.omit(bmx_variables$`2013-2014`) == .x)], 
              .cols = na.omit(bmx_variables$`2013-2014`))

bpq20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/BPQ_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2013-2014`),]$variable[which(na.omit(bpq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(bpq_variables$`2013-2014`))

bpx20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/BPX_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2013-2014`),]$variable[which(na.omit(bpxo_variables$`2013-2014`) == .x)], 
              .cols = na.omit(bpxo_variables$`2013-2014`))

cdq20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/CDQ_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2013-2014`),]$variable[which(na.omit(cdq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(cdq_variables$`2013-2014`))

demo20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/DEMO_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2013-2014`),]$variable[which(na.omit(demo_variables$`2013-2014`) == .x)], 
              .cols = na.omit(demo_variables$`2013-2014`))

diq20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/DIQ_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2013-2014`),]$variable[which(na.omit(diq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(diq_variables$`2013-2014`))

fastqx20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/FASTQX_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`2013-2014`),]$variable[which(na.omit(fastqx_variables$`2013-2014`) == .x)], 
              .cols = na.omit(fastqx_variables$`2013-2014`))

ghb20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/GHB_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2013-2014`),]$variable[which(na.omit(ghb_variables$`2013-2014`) == .x)], 
              .cols = na.omit(ghb_variables$`2013-2014`))

glu20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/GLU_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2013-2014`),]$variable[which(na.omit(glu_variables$`2013-2014`) == .x)], 
              .cols = na.omit(glu_variables$`2013-2014`))

hdl20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/HDL_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2013-2014`),]$variable[which(na.omit(hdl_variables$`2013-2014`) == .x)], 
              .cols = na.omit(hdl_variables$`2013-2014`))

huq20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/HUQ_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2013-2014`),]$variable[which(na.omit(huq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(huq_variables$`2013-2014`))

ins20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/INS_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2013-2014`),]$variable[which(na.omit(ins_variables$`2013-2014`) == .x)], 
              .cols = na.omit(ins_variables$`2013-2014`))

kiq20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/KIQ_U_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2013-2014`),]$variable[which(na.omit(kiq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(kiq_variables$`2013-2014`))

mcq20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/MCQ_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2013-2014`),]$variable[which(na.omit(mcq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(mcq_variables$`2013-2014`))

ogtt20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/OGTT_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ogtt_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ ogtt_variables[!is.na(ogtt_variables$`2013-2014`),]$variable[which(na.omit(ogtt_variables$`2013-2014`) == .x)], 
              .cols = na.omit(ogtt_variables$`2013-2014`))

rxqasa20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/RXQASA_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2013-2014`),]$variable[which(na.omit(rxqasa_variables$`2013-2014`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2013-2014`))

smq20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/SMQ_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2013-2014`),]$variable[which(na.omit(smq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(smq_variables$`2013-2014`))

smqrtu20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/SMQRTU_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2013-2014`),]$variable[which(na.omit(smqrtu_variables$`2013-2014`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2013-2014`))

tchol20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/TCHOL_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2013-2014`),]$variable[which(na.omit(tchol_variables$`2013-2014`) == .x)], 
              .cols = na.omit(tchol_variables$`2013-2014`))

trigly20132014 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2013-2014/TRIGLY_H.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2013-2014`),]$variable[which(na.omit(trigly_variables$`2013-2014`) == .x)], 
              .cols = na.omit(trigly_variables$`2013-2014`))

# Perform the joins
nhanes_20132014 <- alb20132014 %>%
  left_join(biopro20132014, by = "respondentid") %>%
  left_join(bmx20132014, by = "respondentid") %>%
  left_join(bpq20132014, by = "respondentid") %>%
  left_join(bpx20132014, by = "respondentid") %>%
  left_join(cdq20132014, by = "respondentid") %>%
  left_join(demo20132014, by = "respondentid") %>%
  left_join(diq20132014, by = "respondentid") %>%
  left_join(fastqx20132014, by = "respondentid") %>%
  left_join(ghb20132014, by = "respondentid") %>%
  left_join(glu20132014, by = "respondentid") %>%
  left_join(hdl20132014, by = "respondentid") %>%
  left_join(huq20132014, by = "respondentid") %>%
  left_join(ins20132014, by = "respondentid") %>%
  left_join(kiq20132014, by = "respondentid") %>%
  left_join(mcq20132014, by = "respondentid") %>%
  left_join(ogtt20132014, by = "respondentid") %>%
  left_join(rxqasa20132014, by = "respondentid") %>%
  left_join(smq20132014, by = "respondentid") %>%
  left_join(smqrtu20132014, by = "respondentid") %>%
  left_join(tchol20132014, by = "respondentid") %>%
  left_join(trigly20132014, by = "respondentid")

saveRDS(nhanes_20132014, file = paste0(path_nhanes_ckm_cleaned,"/nhanes_20132014.rds"))
