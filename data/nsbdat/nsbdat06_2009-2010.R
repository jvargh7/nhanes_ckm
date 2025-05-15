

rm(list=ls());gc();source(".Rprofile")

source("data/nsbdat/nsbdat_read all variable lists.R")

# For 2009-2010
alb20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/ALB_CR_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2009-2010`),]$variable[which(na.omit(alb_variables$`2009-2010`) == .x)], 
              .cols = na.omit(alb_variables$`2009-2010`))

biopro20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/BIOPRO_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2009-2010`),]$variable[which(na.omit(biopro_variables$`2009-2010`) == .x)], 
              .cols = na.omit(biopro_variables$`2009-2010`))

bmx20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/BMX_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2009-2010`),]$variable[which(na.omit(bmx_variables$`2009-2010`) == .x)], 
              .cols = na.omit(bmx_variables$`2009-2010`))

bpq20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/BPQ_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2009-2010`),]$variable[which(na.omit(bpq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(bpq_variables$`2009-2010`))

bpx20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/BPX_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2009-2010`),]$variable[which(na.omit(bpxo_variables$`2009-2010`) == .x)], 
              .cols = na.omit(bpxo_variables$`2009-2010`))

cdq20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/CDQ_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2009-2010`),]$variable[which(na.omit(cdq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(cdq_variables$`2009-2010`))

demo20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/DEMO_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2009-2010`),]$variable[which(na.omit(demo_variables$`2009-2010`) == .x)], 
              .cols = na.omit(demo_variables$`2009-2010`))

diq20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/DIQ_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2009-2010`),]$variable[which(na.omit(diq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(diq_variables$`2009-2010`))

fastqx20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/FASTQX_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(fastqx_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ fastqx_variables[!is.na(fastqx_variables$`2009-2010`),]$variable[which(na.omit(fastqx_variables$`2009-2010`) == .x)], 
              .cols = na.omit(fastqx_variables$`2009-2010`))

ghb20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/GHB_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2009-2010`),]$variable[which(na.omit(ghb_variables$`2009-2010`) == .x)], 
              .cols = na.omit(ghb_variables$`2009-2010`))

glu20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/GLU_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2009-2010`),]$variable[which(na.omit(glu_variables$`2009-2010`) == .x)], 
              .cols = na.omit(glu_variables$`2009-2010`))

hdl20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/HDL_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2009-2010`),]$variable[which(na.omit(hdl_variables$`2009-2010`) == .x)], 
              .cols = na.omit(hdl_variables$`2009-2010`))

huq20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/HUQ_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2009-2010`),]$variable[which(na.omit(huq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(huq_variables$`2009-2010`))

ins20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/GLU_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2009-2010`),]$variable[which(na.omit(ins_variables$`2009-2010`) == .x)], 
              .cols = na.omit(ins_variables$`2009-2010`))


kiq20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/KIQ_U_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2009-2010`),]$variable[which(na.omit(kiq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(kiq_variables$`2009-2010`))

mcq20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/MCQ_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2009-2010`),]$variable[which(na.omit(mcq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(mcq_variables$`2009-2010`))

ogtt20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/OGTT_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ogtt_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ ogtt_variables[!is.na(ogtt_variables$`2009-2010`),]$variable[which(na.omit(ogtt_variables$`2009-2010`) == .x)], 
              .cols = na.omit(ogtt_variables$`2009-2010`))

smq20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/SMQ_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2009-2010`),]$variable[which(na.omit(smq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(smq_variables$`2009-2010`))

smqrtu20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/SMQRTU_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2009-2010`),]$variable[which(na.omit(smqrtu_variables$`2009-2010`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2009-2010`))

tchol20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/TCHOL_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2009-2010`),]$variable[which(na.omit(tchol_variables$`2009-2010`) == .x)], 
              .cols = na.omit(tchol_variables$`2009-2010`))

trigly20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/TRIGLY_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2009-2010`),]$variable[which(na.omit(trigly_variables$`2009-2010`) == .x)], 
              .cols = na.omit(trigly_variables$`2009-2010`))

hiq20092010 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2009-2010/hiq_F.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hiq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ hiq_variables[!is.na(hiq_variables$`2009-2010`),]$variable[which(na.omit(hiq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(hiq_variables$`2009-2010`))

# Perform the joins
nhanes_20092010 <- alb20092010 %>%
  left_join(biopro20092010, by = "respondentid") %>%
  left_join(bmx20092010, by = "respondentid") %>%
  left_join(bpq20092010, by = "respondentid") %>%
  left_join(bpx20092010, by = "respondentid") %>%
  left_join(cdq20092010, by = "respondentid") %>%
  left_join(demo20092010, by = "respondentid") %>%
  left_join(diq20092010, by = "respondentid") %>%
  left_join(fastqx20092010, by = "respondentid") %>%
  left_join(ghb20092010, by = "respondentid") %>%
  left_join(glu20092010, by = "respondentid") %>%
  left_join(hdl20092010, by = "respondentid") %>%
  left_join(huq20092010, by = "respondentid") %>%
  left_join(ins20092010, by = "respondentid") %>%
  left_join(kiq20092010, by = "respondentid") %>%
  left_join(mcq20092010, by = "respondentid") %>%
  left_join(ogtt20092010, by = "respondentid") %>%
  left_join(smq20092010, by = "respondentid") %>%
  left_join(smqrtu20092010, by = "respondentid") %>%
  left_join(tchol20092010, by = "respondentid") %>%
  left_join(trigly20092010, by = "respondentid") %>%
  left_join(hiq20092010, by = "respondentid")

# Calculating body fat percentage based on Relative Fat Mass (https://www.nature.com/articles/s41598-018-29362-1):
nhanes_20092010 <- nhanes_20092010 %>%
  dplyr::mutate(fat_percentage = ifelse(gender == 1,
                                        64 - (20 * (height / waistcircumference)),  # RFM for men
                                        76 - (20 * (height / waistcircumference)))) # RFM for women

# Adding eGFR variable according to (https://www.kidney.org/ckd-epi-creatinine-equation-2021):
nhanes_20092010 <- nhanes_20092010 %>%
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


saveRDS(nhanes_20092010, file = paste0(path_nhanes_nsb_cleaned,"/nhanes_20092010.rds"))
