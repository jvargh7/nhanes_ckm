
rm(list=ls());gc();source(".Rprofile")

source("data/nsbdat/nsbdat_read all variable lists.R")
# For 2011-2012
alb20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/ALB_CR_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2011-2012`),]$variable[which(na.omit(alb_variables$`2011-2012`) == .x)], 
              .cols = na.omit(alb_variables$`2011-2012`))

biopro20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/BIOPRO_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2011-2012`),]$variable[which(na.omit(biopro_variables$`2011-2012`) == .x)], 
              .cols = na.omit(biopro_variables$`2011-2012`))

bmx20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/BMX_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2011-2012`),]$variable[which(na.omit(bmx_variables$`2011-2012`) == .x)], 
              .cols = na.omit(bmx_variables$`2011-2012`))

bpq20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/BPQ_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2011-2012`),]$variable[which(na.omit(bpq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(bpq_variables$`2011-2012`))

bpx20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/BPX_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2011-2012`),]$variable[which(na.omit(bpxo_variables$`2011-2012`) == .x)], 
              .cols = na.omit(bpxo_variables$`2011-2012`))

cdq20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/CDQ_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2011-2012`),]$variable[which(na.omit(cdq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(cdq_variables$`2011-2012`))

demo20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/DEMO_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2011-2012`),]$variable[which(na.omit(demo_variables$`2011-2012`) == .x)], 
              .cols = na.omit(demo_variables$`2011-2012`))

diq20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/DIQ_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2011-2012`),]$variable[which(na.omit(diq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(diq_variables$`2011-2012`))

fastqx20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/FASTQX_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`2011-2012`),]$variable[which(na.omit(fastqx_variables$`2011-2012`) == .x)], 
              .cols = na.omit(fastqx_variables$`2011-2012`))

ghb20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/GHB_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2011-2012`),]$variable[which(na.omit(ghb_variables$`2011-2012`) == .x)], 
              .cols = na.omit(ghb_variables$`2011-2012`))

glu20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/GLU_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2011-2012`),]$variable[which(na.omit(glu_variables$`2011-2012`) == .x)], 
              .cols = na.omit(glu_variables$`2011-2012`))

hdl20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/HDL_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2011-2012`),]$variable[which(na.omit(hdl_variables$`2011-2012`) == .x)], 
              .cols = na.omit(hdl_variables$`2011-2012`))

huq20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/HUQ_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2011-2012`),]$variable[which(na.omit(huq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(huq_variables$`2011-2012`))

ins20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/GLU_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2011-2012`),]$variable[which(na.omit(ins_variables$`2011-2012`) == .x)], 
              .cols = na.omit(ins_variables$`2011-2012`))

kiq20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/KIQ_U_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2011-2012`),]$variable[which(na.omit(kiq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(kiq_variables$`2011-2012`))

mcq20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/MCQ_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2011-2012`),]$variable[which(na.omit(mcq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(mcq_variables$`2011-2012`))

ogtt20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/OGTT_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ogtt_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ ogtt_variables[!is.na(ogtt_variables$`2011-2012`),]$variable[which(na.omit(ogtt_variables$`2011-2012`) == .x)], 
              .cols = na.omit(ogtt_variables$`2011-2012`))

rxqasa20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/RXQASA_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2011-2012`),]$variable[which(na.omit(rxqasa_variables$`2011-2012`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2011-2012`))

smq20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/SMQ_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2011-2012`),]$variable[which(na.omit(smq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(smq_variables$`2011-2012`))

smqrtu20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/SMQRTU_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2011-2012`),]$variable[which(na.omit(smqrtu_variables$`2011-2012`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2011-2012`))

tchol20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/TCHOL_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2011-2012`),]$variable[which(na.omit(tchol_variables$`2011-2012`) == .x)], 
              .cols = na.omit(tchol_variables$`2011-2012`))

trigly20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/TRIGLY_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2011-2012`),]$variable[which(na.omit(trigly_variables$`2011-2012`) == .x)], 
              .cols = na.omit(trigly_variables$`2011-2012`))

dxx20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/DXX_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(dxx_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ dxx_variables[!is.na(dxx_variables$`2011-2012`),]$variable[which(na.omit(dxx_variables$`2011-2012`) == .x)], 
              .cols = na.omit(dxx_variables$`2011-2012`))

hiq20112012 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2011-2012/hiq_G.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hiq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ hiq_variables[!is.na(hiq_variables$`2011-2012`),]$variable[which(na.omit(hiq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(hiq_variables$`2011-2012`))

# Perform the joins
nhanes_20112012 <- alb20112012 %>%
  left_join(biopro20112012, by = "respondentid") %>%
  left_join(bmx20112012, by = "respondentid") %>%
  left_join(bpq20112012, by = "respondentid") %>%
  left_join(bpx20112012, by = "respondentid") %>%
  left_join(cdq20112012, by = "respondentid") %>%
  left_join(demo20112012, by = "respondentid") %>%
  left_join(diq20112012, by = "respondentid") %>%
  left_join(fastqx20112012, by = "respondentid") %>%
  left_join(ghb20112012, by = "respondentid") %>%
  left_join(glu20112012, by = "respondentid") %>%
  left_join(hdl20112012, by = "respondentid") %>%
  left_join(huq20112012, by = "respondentid") %>%
  left_join(ins20112012, by = "respondentid") %>%
  left_join(kiq20112012, by = "respondentid") %>%
  left_join(mcq20112012, by = "respondentid") %>%
  left_join(ogtt20112012, by = "respondentid") %>%
  left_join(rxqasa20112012, by = "respondentid") %>%
  left_join(smq20112012, by = "respondentid") %>%
  left_join(smqrtu20112012, by = "respondentid") %>%
  left_join(tchol20112012, by = "respondentid") %>%
  left_join(trigly20112012, by = "respondentid") %>%
  left_join(dxx20112012, by = "respondentid") %>%
  left_join(hiq20112012, by = "respondentid")

# Adding eGFR variable according to (https://www.kidney.org/ckd-epi-creatinine-equation-2021):
nhanes_20112012 <- nhanes_20112012 %>%
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

saveRDS(nhanes_20112012, file = paste0(path_nhanes_nsb_cleaned,"/nhanes_20112012.rds"))
