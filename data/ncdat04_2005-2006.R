
rm(list=ls());gc();source(".Rprofile")

source("data/ncdat_read all variable lists.R")

# For 2005-2006
alb20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/ALB_CR_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2005-2006`),]$variable[which(na.omit(alb_variables$`2005-2006`) == .x)], 
              .cols = na.omit(alb_variables$`2005-2006`))

biopro20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/BIOPRO_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2005-2006`),]$variable[which(na.omit(biopro_variables$`2005-2006`) == .x)], 
              .cols = na.omit(biopro_variables$`2005-2006`))

bmx20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/BMX_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2005-2006`),]$variable[which(na.omit(bmx_variables$`2005-2006`) == .x)], 
              .cols = na.omit(bmx_variables$`2005-2006`))

bpq20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/BPQ_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2005-2006`),]$variable[which(na.omit(bpq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(bpq_variables$`2005-2006`))

bpx20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/BPX_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2005-2006`),]$variable[which(na.omit(bpxo_variables$`2005-2006`) == .x)], 
              .cols = na.omit(bpxo_variables$`2005-2006`))

cdq20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/CDQ_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2005-2006`),]$variable[which(na.omit(cdq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(cdq_variables$`2005-2006`))

demo20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/DEMO_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2005-2006`),]$variable[which(na.omit(demo_variables$`2005-2006`) == .x)], 
              .cols = na.omit(demo_variables$`2005-2006`))

diq20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/DIQ_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2005-2006`),]$variable[which(na.omit(diq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(diq_variables$`2005-2006`))

fastqx20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/FASTQX_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`2005-2006`),]$variable[which(na.omit(fastqx_variables$`2005-2006`) == .x)], 
              .cols = na.omit(fastqx_variables$`2005-2006`))

ghb20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/GHB_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2005-2006`),]$variable[which(na.omit(ghb_variables$`2005-2006`) == .x)], 
              .cols = na.omit(ghb_variables$`2005-2006`))

glu20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/GLU_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2005-2006`),]$variable[which(na.omit(glu_variables$`2005-2006`) == .x)], 
              .cols = na.omit(glu_variables$`2005-2006`))

hdl20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/HDL_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2005-2006`),]$variable[which(na.omit(hdl_variables$`2005-2006`) == .x)], 
              .cols = na.omit(hdl_variables$`2005-2006`))

huq20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/HUQ_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2005-2006`),]$variable[which(na.omit(huq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(huq_variables$`2005-2006`))

ins20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/GLU_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2005-2006`),]$variable[which(na.omit(ins_variables$`2005-2006`) == .x)], 
              .cols = na.omit(ins_variables$`2005-2006`))

kiq20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/KIQ_U_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2005-2006`),]$variable[which(na.omit(kiq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(kiq_variables$`2005-2006`))

mcq20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/MCQ_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2005-2006`),]$variable[which(na.omit(mcq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(mcq_variables$`2005-2006`))

ogtt20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/OGTT_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ogtt_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ ogtt_variables[!is.na(ogtt_variables$`2005-2006`),]$variable[which(na.omit(ogtt_variables$`2005-2006`) == .x)], 
              .cols = na.omit(ogtt_variables$`2005-2006`))

smq20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/SMQ_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2005-2006`),]$variable[which(na.omit(smq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(smq_variables$`2005-2006`))

smqrtu20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/SMQRTU_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2005-2006`),]$variable[which(na.omit(smqrtu_variables$`2005-2006`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2005-2006`))

tchol20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/TCHOL_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2005-2006`),]$variable[which(na.omit(tchol_variables$`2005-2006`) == .x)], 
              .cols = na.omit(tchol_variables$`2005-2006`))

trigly20052006 <- read_xpt(paste0(path_nhanes_ckm_raw,"/2005-2006/TRIGLY_D.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2005-2006`),]$variable[which(na.omit(trigly_variables$`2005-2006`) == .x)], 
              .cols = na.omit(trigly_variables$`2005-2006`))

# Perform the joins
nhanes_20052006 <- alb20052006 %>%
  left_join(biopro20052006, by = "respondentid") %>%
  left_join(bmx20052006, by = "respondentid") %>%
  left_join(bpq20052006, by = "respondentid") %>%
  left_join(bpx20052006, by = "respondentid") %>%
  left_join(cdq20052006, by = "respondentid") %>%
  left_join(demo20052006, by = "respondentid") %>%
  left_join(diq20052006, by = "respondentid") %>%
  left_join(fastqx20052006, by = "respondentid") %>%
  left_join(ghb20052006, by = "respondentid") %>%
  left_join(glu20052006, by = "respondentid") %>%
  left_join(hdl20052006, by = "respondentid") %>%
  left_join(huq20052006, by = "respondentid") %>%
  left_join(ins20052006, by = "respondentid") %>%
  left_join(kiq20052006, by = "respondentid") %>%
  left_join(mcq20052006, by = "respondentid") %>%
  left_join(ogtt20052006, by = "respondentid") %>%
  left_join(smq20052006, by = "respondentid") %>%
  left_join(smqrtu20052006, by = "respondentid") %>%
  left_join(tchol20052006, by = "respondentid") %>%
  left_join(trigly20052006, by = "respondentid")

saveRDS(nhanes_20052006, file = paste0(path_nhanes_ckm_cleaned,"/nhanes_20052006.rds"))
