# Load necessary libraries
library(Hmisc)
library(dplyr)
library(readxl)

# Loading in all the sets of variables:
alb_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="ALB_CR")

biopro_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="BIOPRO")

bmx_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="BMX")

bpq_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="BPQ")

bpxo_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="BPXO")

cdq_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="CDQ")

demo_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="DEMO")

diq_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="DIQ")

ghb_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="GHB")

glu_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="GLU")

hdl_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="HDL")

hscrp_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="HSCRP")

huq_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="HUQ")

inq_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="INQ")

ins_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="INS")

kiq_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="KIQ_U")

mcq_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="MCQ")

rxqasa_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="RXQASA")

smq_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="SMQ")

smqrtu_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="SMQRTU")

ssagp_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="SSAGP")

tchol_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="TCHOL")

trigly_variables <- readxl::read_excel("/Users/krishnasanaka/Desktop/Public Health Research/CKM/CKM Variable List Updated.xlsx", sheet="TRIGLY")

# Loading in the 2017-Mar2020 datasets:
alb2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_ALB_CR.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2017-Mar2020`),]$variable[which(na.omit(alb_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(alb_variables$`2017-Mar2020`))

biopro2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_BIOPRO.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2017-Mar2020`),]$variable[which(na.omit(biopro_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(biopro_variables$`2017-Mar2020`))

bmx2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_BMX.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2017-Mar2020`),]$variable[which(na.omit(bmx_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(bmx_variables$`2017-Mar2020`))

bpq2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_BPQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2017-Mar2020`),]$variable[which(na.omit(bpq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(bpq_variables$`2017-Mar2020`))

bpxo2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_BPXO.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2017-Mar2020`),]$variable[which(na.omit(bpxo_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(bpxo_variables$`2017-Mar2020`))

cdq2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_CDQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2017-Mar2020`),]$variable[which(na.omit(cdq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(cdq_variables$`2017-Mar2020`))

demo2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_DEMO.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2017-Mar2020`),]$variable[which(na.omit(demo_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(demo_variables$`2017-Mar2020`))

diq2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_DIQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2017-Mar2020`),]$variable[which(na.omit(diq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(diq_variables$`2017-Mar2020`))

ghb2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_GHB.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2017-Mar2020`),]$variable[which(na.omit(ghb_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(ghb_variables$`2017-Mar2020`))

glu2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_GLU.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2017-Mar2020`),]$variable[which(na.omit(glu_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(glu_variables$`2017-Mar2020`))

hdl2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_HDL.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2017-Mar2020`),]$variable[which(na.omit(hdl_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(hdl_variables$`2017-Mar2020`))

hscrp2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_HSCRP.XPT") %>%
  # Select columns
  select(all_of(na.omit(hscrp_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ hscrp_variables[!is.na(hscrp_variables$`2017-Mar2020`),]$variable[which(na.omit(hscrp_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(hscrp_variables$`2017-Mar2020`))

huq2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_HUQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2017-Mar2020`),]$variable[which(na.omit(huq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(huq_variables$`2017-Mar2020`))

inq2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_INQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(inq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ inq_variables[!is.na(inq_variables$`2017-Mar2020`),]$variable[which(na.omit(inq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(inq_variables$`2017-Mar2020`))

ins2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_INS.XPT") %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2017-Mar2020`),]$variable[which(na.omit(ins_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(ins_variables$`2017-Mar2020`))

kiq2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_KIQ_U.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2017-Mar2020`),]$variable[which(na.omit(kiq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(kiq_variables$`2017-Mar2020`))

mcq2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_MCQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2017-Mar2020`),]$variable[which(na.omit(mcq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(mcq_variables$`2017-Mar2020`))

rxqasa2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_RXQASA.XPT") %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2017-Mar2020`),]$variable[which(na.omit(rxqasa_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2017-Mar2020`))

smq2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_SMQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2017-Mar2020`),]$variable[which(na.omit(smq_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(smq_variables$`2017-Mar2020`))

smqrtu2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_SMQRTU.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2017-Mar2020`),]$variable[which(na.omit(smqrtu_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2017-Mar2020`))

ssagp2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_SSAGP.XPT") %>%
  # Select columns
  select(all_of(na.omit(ssagp_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ ssagp_variables[!is.na(ssagp_variables$`2017-Mar2020`),]$variable[which(na.omit(ssagp_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(ssagp_variables$`2017-Mar2020`))

tchol2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_TCHOL.XPT") %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2017-Mar2020`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2017-Mar2020`),]$variable[which(na.omit(tchol_variables$`2017-Mar2020`) == .x)], 
              .cols = na.omit(tchol_variables$`2017-Mar2020`))

trigly2017Mar2020 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-Mar2020/P_TRIGLY.XPT") %>%
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

# Repeat for 2017-2018:
alb20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/ALB_CR_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2017-2018`),]$variable[which(na.omit(alb_variables$`2017-2018`) == .x)], 
              .cols = na.omit(alb_variables$`2017-2018`))

biopro20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/BIOPRO_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2017-2018`),]$variable[which(na.omit(biopro_variables$`2017-2018`) == .x)], 
              .cols = na.omit(biopro_variables$`2017-2018`))

bmx20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/BMX_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2017-2018`),]$variable[which(na.omit(bmx_variables$`2017-2018`) == .x)], 
              .cols = na.omit(bmx_variables$`2017-2018`))

bpq20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/BPQ_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2017-2018`),]$variable[which(na.omit(bpq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(bpq_variables$`2017-2018`))

bpx20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/BPX_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2017-2018`),]$variable[which(na.omit(bpxo_variables$`2017-2018`) == .x)], 
              .cols = na.omit(bpxo_variables$`2017-2018`))

cdq20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/CDQ_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2017-2018`),]$variable[which(na.omit(cdq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(cdq_variables$`2017-2018`))

demo20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/DEMO_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2017-2018`),]$variable[which(na.omit(demo_variables$`2017-2018`) == .x)], 
              .cols = na.omit(demo_variables$`2017-2018`))

diq20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/DIQ_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2017-2018`),]$variable[which(na.omit(diq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(diq_variables$`2017-2018`))

ghb20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/GHB_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2017-2018`),]$variable[which(na.omit(ghb_variables$`2017-2018`) == .x)], 
              .cols = na.omit(ghb_variables$`2017-2018`))

glu20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/GLU_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2017-2018`),]$variable[which(na.omit(glu_variables$`2017-2018`) == .x)], 
              .cols = na.omit(glu_variables$`2017-2018`))

hdl20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/HDL_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2017-2018`),]$variable[which(na.omit(hdl_variables$`2017-2018`) == .x)], 
              .cols = na.omit(hdl_variables$`2017-2018`))

hscrp20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/HSCRP_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(hscrp_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ hscrp_variables[!is.na(hscrp_variables$`2017-2018`),]$variable[which(na.omit(hscrp_variables$`2017-2018`) == .x)], 
              .cols = na.omit(hscrp_variables$`2017-2018`))

huq20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/HUQ_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2017-2018`),]$variable[which(na.omit(huq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(huq_variables$`2017-2018`))

ins20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/INS_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2017-2018`),]$variable[which(na.omit(ins_variables$`2017-2018`) == .x)], 
              .cols = na.omit(ins_variables$`2017-2018`))

kiq20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/KIQ_U_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2017-2018`),]$variable[which(na.omit(kiq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(kiq_variables$`2017-2018`))

mcq20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/MCQ_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2017-2018`),]$variable[which(na.omit(mcq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(mcq_variables$`2017-2018`))

rxqasa20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/RXQASA_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2017-2018`),]$variable[which(na.omit(rxqasa_variables$`2017-2018`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2017-2018`))

smq20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/SMQ_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2017-2018`),]$variable[which(na.omit(smq_variables$`2017-2018`) == .x)], 
              .cols = na.omit(smq_variables$`2017-2018`))

smqrtu20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/SMQRTU_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2017-2018`),]$variable[which(na.omit(smqrtu_variables$`2017-2018`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2017-2018`))

ssagp20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/SSAGP_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(ssagp_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ ssagp_variables[!is.na(ssagp_variables$`2017-2018`),]$variable[which(na.omit(ssagp_variables$`2017-2018`) == .x)], 
              .cols = na.omit(ssagp_variables$`2017-2018`))

tchol20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/TCHOL_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2017-2018`),]$variable[which(na.omit(tchol_variables$`2017-2018`) == .x)], 
              .cols = na.omit(tchol_variables$`2017-2018`))

trigly20172018 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2017-2018/TRIGLY_J.XPT") %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2017-2018`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2017-2018`),]$variable[which(na.omit(trigly_variables$`2017-2018`) == .x)], 
              .cols = na.omit(trigly_variables$`2017-2018`))

# Perform the joins
nhanes_20172018 <- alb20172018 %>%
  left_join(biopro20172018, by = "respondentid") %>%
  left_join(bmx20172018, by = "respondentid") %>%
  left_join(bpq20172018, by = "respondentid") %>%
  left_join(bpx20172018, by = "respondentid") %>%
  left_join(cdq20172018, by = "respondentid") %>%
  left_join(demo20172018, by = "respondentid") %>%
  left_join(diq20172018, by = "respondentid") %>%
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
  left_join(trigly20172018, by = "respondentid")

# For 2015-2016:
alb20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/ALB_CR_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2015-2016`),]$variable[which(na.omit(alb_variables$`2015-2016`) == .x)], 
              .cols = na.omit(alb_variables$`2015-2016`))

biopro20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/BIOPRO_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2015-2016`),]$variable[which(na.omit(biopro_variables$`2015-2016`) == .x)], 
              .cols = na.omit(biopro_variables$`2015-2016`))

bmx20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/BMX_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2015-2016`),]$variable[which(na.omit(bmx_variables$`2015-2016`) == .x)], 
              .cols = na.omit(bmx_variables$`2015-2016`))

bpq20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/BPQ_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2015-2016`),]$variable[which(na.omit(bpq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(bpq_variables$`2015-2016`))

bpx20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/BPX_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2015-2016`),]$variable[which(na.omit(bpxo_variables$`2015-2016`) == .x)], 
              .cols = na.omit(bpxo_variables$`2015-2016`))

cdq20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/CDQ_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2015-2016`),]$variable[which(na.omit(cdq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(cdq_variables$`2015-2016`))

demo20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/DEMO_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2015-2016`),]$variable[which(na.omit(demo_variables$`2015-2016`) == .x)], 
              .cols = na.omit(demo_variables$`2015-2016`))

diq20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/DIQ_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2015-2016`),]$variable[which(na.omit(diq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(diq_variables$`2015-2016`))

ghb20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/GHB_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2015-2016`),]$variable[which(na.omit(ghb_variables$`2015-2016`) == .x)], 
              .cols = na.omit(ghb_variables$`2015-2016`))

glu20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/GLU_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2015-2016`),]$variable[which(na.omit(glu_variables$`2015-2016`) == .x)], 
              .cols = na.omit(glu_variables$`2015-2016`))

hdl20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/HDL_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2015-2016`),]$variable[which(na.omit(hdl_variables$`2015-2016`) == .x)], 
              .cols = na.omit(hdl_variables$`2015-2016`))

hscrp20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/HSCRP_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(hscrp_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ hscrp_variables[!is.na(hscrp_variables$`2015-2016`),]$variable[which(na.omit(hscrp_variables$`2015-2016`) == .x)], 
              .cols = na.omit(hscrp_variables$`2015-2016`))

huq20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/HUQ_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2015-2016`),]$variable[which(na.omit(huq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(huq_variables$`2015-2016`))

ins20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/INS_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2015-2016`),]$variable[which(na.omit(ins_variables$`2015-2016`) == .x)], 
              .cols = na.omit(ins_variables$`2015-2016`))

kiq20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/KIQ_U_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2015-2016`),]$variable[which(na.omit(kiq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(kiq_variables$`2015-2016`))

mcq20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/MCQ_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2015-2016`),]$variable[which(na.omit(mcq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(mcq_variables$`2015-2016`))

rxqasa20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/RXQASA_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2015-2016`),]$variable[which(na.omit(rxqasa_variables$`2015-2016`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2015-2016`))

smq20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/SMQ_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2015-2016`),]$variable[which(na.omit(smq_variables$`2015-2016`) == .x)], 
              .cols = na.omit(smq_variables$`2015-2016`))

smqrtu20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/SMQRTU_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2015-2016`),]$variable[which(na.omit(smqrtu_variables$`2015-2016`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2015-2016`))

ssagp20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/SSAGP_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(ssagp_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ ssagp_variables[!is.na(ssagp_variables$`2015-2016`),]$variable[which(na.omit(ssagp_variables$`2015-2016`) == .x)], 
              .cols = na.omit(ssagp_variables$`2015-2016`))

tchol20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/TCHOL_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2015-2016`),]$variable[which(na.omit(tchol_variables$`2015-2016`) == .x)], 
              .cols = na.omit(tchol_variables$`2015-2016`))

trigly20152016 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2015-2016/TRIGLY_I.XPT") %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2015-2016`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2015-2016`),]$variable[which(na.omit(trigly_variables$`2015-2016`) == .x)], 
              .cols = na.omit(trigly_variables$`2015-2016`))

# Perform the joins
nhanes_20152016 <- alb20152016 %>%
  left_join(biopro20152016, by = "respondentid") %>%
  left_join(bmx20152016, by = "respondentid") %>%
  left_join(bpq20152016, by = "respondentid") %>%
  left_join(bpx20152016, by = "respondentid") %>%
  left_join(cdq20152016, by = "respondentid") %>%
  left_join(demo20152016, by = "respondentid") %>%
  left_join(diq20152016, by = "respondentid") %>%
  left_join(ghb20152016, by = "respondentid") %>%
  left_join(glu20152016, by = "respondentid") %>%
  left_join(hdl20152016, by = "respondentid") %>%
  left_join(hscrp20152016, by = "respondentid") %>%
  left_join(huq20152016, by = "respondentid") %>%
  left_join(ins20152016, by = "respondentid") %>%
  left_join(kiq20152016, by = "respondentid") %>%
  left_join(mcq20152016, by = "respondentid") %>%
  left_join(rxqasa20152016, by = "respondentid") %>%
  left_join(smq20152016, by = "respondentid") %>%
  left_join(smqrtu20152016, by = "respondentid") %>%
  left_join(ssagp20152016, by = "respondentid") %>%
  left_join(tchol20152016, by = "respondentid") %>%
  left_join(trigly20152016, by = "respondentid")

# For 2013-2014
alb20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/ALB_CR_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2013-2014`),]$variable[which(na.omit(alb_variables$`2013-2014`) == .x)], 
              .cols = na.omit(alb_variables$`2013-2014`))

biopro20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/BIOPRO_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2013-2014`),]$variable[which(na.omit(biopro_variables$`2013-2014`) == .x)], 
              .cols = na.omit(biopro_variables$`2013-2014`))

bmx20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/BMX_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2013-2014`),]$variable[which(na.omit(bmx_variables$`2013-2014`) == .x)], 
              .cols = na.omit(bmx_variables$`2013-2014`))

bpq20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/BPQ_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2013-2014`),]$variable[which(na.omit(bpq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(bpq_variables$`2013-2014`))

bpx20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/BPX_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2013-2014`),]$variable[which(na.omit(bpxo_variables$`2013-2014`) == .x)], 
              .cols = na.omit(bpxo_variables$`2013-2014`))

cdq20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/CDQ_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2013-2014`),]$variable[which(na.omit(cdq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(cdq_variables$`2013-2014`))

demo20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/DEMO_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2013-2014`),]$variable[which(na.omit(demo_variables$`2013-2014`) == .x)], 
              .cols = na.omit(demo_variables$`2013-2014`))

diq20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/DIQ_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2013-2014`),]$variable[which(na.omit(diq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(diq_variables$`2013-2014`))

ghb20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/GHB_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2013-2014`),]$variable[which(na.omit(ghb_variables$`2013-2014`) == .x)], 
              .cols = na.omit(ghb_variables$`2013-2014`))

glu20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/GLU_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2013-2014`),]$variable[which(na.omit(glu_variables$`2013-2014`) == .x)], 
              .cols = na.omit(glu_variables$`2013-2014`))

hdl20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/HDL_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2013-2014`),]$variable[which(na.omit(hdl_variables$`2013-2014`) == .x)], 
              .cols = na.omit(hdl_variables$`2013-2014`))

huq20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/HUQ_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2013-2014`),]$variable[which(na.omit(huq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(huq_variables$`2013-2014`))

ins20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/INS_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2013-2014`),]$variable[which(na.omit(ins_variables$`2013-2014`) == .x)], 
              .cols = na.omit(ins_variables$`2013-2014`))

kiq20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/KIQ_U_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2013-2014`),]$variable[which(na.omit(kiq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(kiq_variables$`2013-2014`))

mcq20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/MCQ_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2013-2014`),]$variable[which(na.omit(mcq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(mcq_variables$`2013-2014`))

rxqasa20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/RXQASA_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2013-2014`),]$variable[which(na.omit(rxqasa_variables$`2013-2014`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2013-2014`))

smq20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/SMQ_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2013-2014`),]$variable[which(na.omit(smq_variables$`2013-2014`) == .x)], 
              .cols = na.omit(smq_variables$`2013-2014`))

smqrtu20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/SMQRTU_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2013-2014`),]$variable[which(na.omit(smqrtu_variables$`2013-2014`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2013-2014`))

tchol20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/TCHOL_H.XPT") %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2013-2014`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2013-2014`),]$variable[which(na.omit(tchol_variables$`2013-2014`) == .x)], 
              .cols = na.omit(tchol_variables$`2013-2014`))

trigly20132014 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2013-2014/TRIGLY_H.XPT") %>%
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
  left_join(ghb20132014, by = "respondentid") %>%
  left_join(glu20132014, by = "respondentid") %>%
  left_join(hdl20132014, by = "respondentid") %>%
  left_join(huq20132014, by = "respondentid") %>%
  left_join(ins20132014, by = "respondentid") %>%
  left_join(kiq20132014, by = "respondentid") %>%
  left_join(mcq20132014, by = "respondentid") %>%
  left_join(rxqasa20132014, by = "respondentid") %>%
  left_join(smq20132014, by = "respondentid") %>%
  left_join(smqrtu20132014, by = "respondentid") %>%
  left_join(tchol20132014, by = "respondentid") %>%
  left_join(trigly20132014, by = "respondentid")

# For 2011-2012
alb20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/ALB_CR_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2011-2012`),]$variable[which(na.omit(alb_variables$`2011-2012`) == .x)], 
              .cols = na.omit(alb_variables$`2011-2012`))

biopro20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/BIOPRO_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2011-2012`),]$variable[which(na.omit(biopro_variables$`2011-2012`) == .x)], 
              .cols = na.omit(biopro_variables$`2011-2012`))

bmx20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/BMX_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2011-2012`),]$variable[which(na.omit(bmx_variables$`2011-2012`) == .x)], 
              .cols = na.omit(bmx_variables$`2011-2012`))

bpq20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/BPQ_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2011-2012`),]$variable[which(na.omit(bpq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(bpq_variables$`2011-2012`))

bpx20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/BPX_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2011-2012`),]$variable[which(na.omit(bpxo_variables$`2011-2012`) == .x)], 
              .cols = na.omit(bpxo_variables$`2011-2012`))

cdq20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/CDQ_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2011-2012`),]$variable[which(na.omit(cdq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(cdq_variables$`2011-2012`))

demo20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/DEMO_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2011-2012`),]$variable[which(na.omit(demo_variables$`2011-2012`) == .x)], 
              .cols = na.omit(demo_variables$`2011-2012`))

diq20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/DIQ_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2011-2012`),]$variable[which(na.omit(diq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(diq_variables$`2011-2012`))

ghb20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/GHB_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2011-2012`),]$variable[which(na.omit(ghb_variables$`2011-2012`) == .x)], 
              .cols = na.omit(ghb_variables$`2011-2012`))

glu20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/GLU_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2011-2012`),]$variable[which(na.omit(glu_variables$`2011-2012`) == .x)], 
              .cols = na.omit(glu_variables$`2011-2012`))

hdl20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/HDL_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2011-2012`),]$variable[which(na.omit(hdl_variables$`2011-2012`) == .x)], 
              .cols = na.omit(hdl_variables$`2011-2012`))

huq20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/HUQ_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2011-2012`),]$variable[which(na.omit(huq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(huq_variables$`2011-2012`))

kiq20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/KIQ_U_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2011-2012`),]$variable[which(na.omit(kiq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(kiq_variables$`2011-2012`))

mcq20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/MCQ_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2011-2012`),]$variable[which(na.omit(mcq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(mcq_variables$`2011-2012`))

rxqasa20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/RXQASA_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2011-2012`),]$variable[which(na.omit(rxqasa_variables$`2011-2012`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2011-2012`))

smq20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/SMQ_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2011-2012`),]$variable[which(na.omit(smq_variables$`2011-2012`) == .x)], 
              .cols = na.omit(smq_variables$`2011-2012`))

smqrtu20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/SMQRTU_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2011-2012`),]$variable[which(na.omit(smqrtu_variables$`2011-2012`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2011-2012`))

tchol20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/TCHOL_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2011-2012`),]$variable[which(na.omit(tchol_variables$`2011-2012`) == .x)], 
              .cols = na.omit(tchol_variables$`2011-2012`))

trigly20112012 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2011-2012/TRIGLY_G.XPT") %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2011-2012`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2011-2012`),]$variable[which(na.omit(trigly_variables$`2011-2012`) == .x)], 
              .cols = na.omit(trigly_variables$`2011-2012`))

# Perform the joins
nhanes_20112012 <- alb20112012 %>%
  left_join(biopro20112012, by = "respondentid") %>%
  left_join(bmx20112012, by = "respondentid") %>%
  left_join(bpq20112012, by = "respondentid") %>%
  left_join(bpx20112012, by = "respondentid") %>%
  left_join(cdq20112012, by = "respondentid") %>%
  left_join(demo20112012, by = "respondentid") %>%
  left_join(diq20112012, by = "respondentid") %>%
  left_join(ghb20112012, by = "respondentid") %>%
  left_join(glu20112012, by = "respondentid") %>%
  left_join(hdl20112012, by = "respondentid") %>%
  left_join(huq20112012, by = "respondentid") %>%
  left_join(kiq20112012, by = "respondentid") %>%
  left_join(mcq20112012, by = "respondentid") %>%
  left_join(rxqasa20112012, by = "respondentid") %>%
  left_join(smq20112012, by = "respondentid") %>%
  left_join(smqrtu20112012, by = "respondentid") %>%
  left_join(tchol20112012, by = "respondentid") %>%
  left_join(trigly20112012, by = "respondentid")

# For 2009-2010
alb20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/ALB_CR_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2009-2010`),]$variable[which(na.omit(alb_variables$`2009-2010`) == .x)], 
              .cols = na.omit(alb_variables$`2009-2010`))

biopro20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/BIOPRO_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2009-2010`),]$variable[which(na.omit(biopro_variables$`2009-2010`) == .x)], 
              .cols = na.omit(biopro_variables$`2009-2010`))

bmx20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/BMX_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2009-2010`),]$variable[which(na.omit(bmx_variables$`2009-2010`) == .x)], 
              .cols = na.omit(bmx_variables$`2009-2010`))

bpq20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/BPQ_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2009-2010`),]$variable[which(na.omit(bpq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(bpq_variables$`2009-2010`))

bpx20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/BPX_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2009-2010`),]$variable[which(na.omit(bpxo_variables$`2009-2010`) == .x)], 
              .cols = na.omit(bpxo_variables$`2009-2010`))

cdq20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/CDQ_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2009-2010`),]$variable[which(na.omit(cdq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(cdq_variables$`2009-2010`))

demo20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/DEMO_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2009-2010`),]$variable[which(na.omit(demo_variables$`2009-2010`) == .x)], 
              .cols = na.omit(demo_variables$`2009-2010`))

diq20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/DIQ_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2009-2010`),]$variable[which(na.omit(diq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(diq_variables$`2009-2010`))

ghb20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/GHB_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2009-2010`),]$variable[which(na.omit(ghb_variables$`2009-2010`) == .x)], 
              .cols = na.omit(ghb_variables$`2009-2010`))

glu20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/GLU_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2009-2010`),]$variable[which(na.omit(glu_variables$`2009-2010`) == .x)], 
              .cols = na.omit(glu_variables$`2009-2010`))

hdl20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/HDL_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2009-2010`),]$variable[which(na.omit(hdl_variables$`2009-2010`) == .x)], 
              .cols = na.omit(hdl_variables$`2009-2010`))

huq20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/HUQ_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2009-2010`),]$variable[which(na.omit(huq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(huq_variables$`2009-2010`))

kiq20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/KIQ_U_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2009-2010`),]$variable[which(na.omit(kiq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(kiq_variables$`2009-2010`))

mcq20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/MCQ_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2009-2010`),]$variable[which(na.omit(mcq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(mcq_variables$`2009-2010`))

smq20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/SMQ_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2009-2010`),]$variable[which(na.omit(smq_variables$`2009-2010`) == .x)], 
              .cols = na.omit(smq_variables$`2009-2010`))

smqrtu20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/SMQRTU_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2009-2010`),]$variable[which(na.omit(smqrtu_variables$`2009-2010`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2009-2010`))

tchol20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/TCHOL_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2009-2010`),]$variable[which(na.omit(tchol_variables$`2009-2010`) == .x)], 
              .cols = na.omit(tchol_variables$`2009-2010`))

trigly20092010 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2009-2010/TRIGLY_F.XPT") %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2009-2010`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2009-2010`),]$variable[which(na.omit(trigly_variables$`2009-2010`) == .x)], 
              .cols = na.omit(trigly_variables$`2009-2010`))

# Perform the joins
nhanes_20092010 <- alb20092010 %>%
  left_join(biopro20092010, by = "respondentid") %>%
  left_join(bmx20092010, by = "respondentid") %>%
  left_join(bpq20092010, by = "respondentid") %>%
  left_join(bpx20092010, by = "respondentid") %>%
  left_join(cdq20092010, by = "respondentid") %>%
  left_join(demo20092010, by = "respondentid") %>%
  left_join(diq20092010, by = "respondentid") %>%
  left_join(ghb20092010, by = "respondentid") %>%
  left_join(glu20092010, by = "respondentid") %>%
  left_join(hdl20092010, by = "respondentid") %>%
  left_join(huq20092010, by = "respondentid") %>%
  left_join(kiq20092010, by = "respondentid") %>%
  left_join(mcq20092010, by = "respondentid") %>%
  left_join(smq20092010, by = "respondentid") %>%
  left_join(smqrtu20092010, by = "respondentid") %>%
  left_join(tchol20092010, by = "respondentid") %>%
  left_join(trigly20092010, by = "respondentid")

# For 2007-2008
alb20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/ALB_CR_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2007-2008`),]$variable[which(na.omit(alb_variables$`2007-2008`) == .x)], 
              .cols = na.omit(alb_variables$`2007-2008`))

biopro20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/BIOPRO_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2007-2008`),]$variable[which(na.omit(biopro_variables$`2007-2008`) == .x)], 
              .cols = na.omit(biopro_variables$`2007-2008`))

bmx20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/BMX_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2007-2008`),]$variable[which(na.omit(bmx_variables$`2007-2008`) == .x)], 
              .cols = na.omit(bmx_variables$`2007-2008`))

bpq20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/BPQ_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2007-2008`),]$variable[which(na.omit(bpq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(bpq_variables$`2007-2008`))

bpx20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/BPX_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2007-2008`),]$variable[which(na.omit(bpxo_variables$`2007-2008`) == .x)], 
              .cols = na.omit(bpxo_variables$`2007-2008`))

cdq20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/CDQ_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2007-2008`),]$variable[which(na.omit(cdq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(cdq_variables$`2007-2008`))

demo20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/DEMO_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2007-2008`),]$variable[which(na.omit(demo_variables$`2007-2008`) == .x)], 
              .cols = na.omit(demo_variables$`2007-2008`))

diq20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/DIQ_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2007-2008`),]$variable[which(na.omit(diq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(diq_variables$`2007-2008`))

ghb20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/GHB_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2007-2008`),]$variable[which(na.omit(ghb_variables$`2007-2008`) == .x)], 
              .cols = na.omit(ghb_variables$`2007-2008`))

glu20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/GLU_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2007-2008`),]$variable[which(na.omit(glu_variables$`2007-2008`) == .x)], 
              .cols = na.omit(glu_variables$`2007-2008`))

hdl20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/HDL_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2007-2008`),]$variable[which(na.omit(hdl_variables$`2007-2008`) == .x)], 
              .cols = na.omit(hdl_variables$`2007-2008`))

huq20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/HUQ_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2007-2008`),]$variable[which(na.omit(huq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(huq_variables$`2007-2008`))

kiq20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/KIQ_U_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2007-2008`),]$variable[which(na.omit(kiq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(kiq_variables$`2007-2008`))

mcq20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/MCQ_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2007-2008`),]$variable[which(na.omit(mcq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(mcq_variables$`2007-2008`))

smq20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/SMQ_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2007-2008`),]$variable[which(na.omit(smq_variables$`2007-2008`) == .x)], 
              .cols = na.omit(smq_variables$`2007-2008`))

smqrtu20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/SMQRTU_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2007-2008`),]$variable[which(na.omit(smqrtu_variables$`2007-2008`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2007-2008`))

tchol20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/TCHOL_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2007-2008`),]$variable[which(na.omit(tchol_variables$`2007-2008`) == .x)], 
              .cols = na.omit(tchol_variables$`2007-2008`))

trigly20072008 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2007-2008/TRIGLY_E.XPT") %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2007-2008`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2007-2008`),]$variable[which(na.omit(trigly_variables$`2007-2008`) == .x)], 
              .cols = na.omit(trigly_variables$`2007-2008`))

# Perform the joins
nhanes_20072008 <- alb20072008 %>%
  left_join(biopro20072008, by = "respondentid") %>%
  left_join(bmx20072008, by = "respondentid") %>%
  left_join(bpq20072008, by = "respondentid") %>%
  left_join(bpx20072008, by = "respondentid") %>%
  left_join(cdq20072008, by = "respondentid") %>%
  left_join(demo20072008, by = "respondentid") %>%
  left_join(diq20072008, by = "respondentid") %>%
  left_join(ghb20072008, by = "respondentid") %>%
  left_join(glu20072008, by = "respondentid") %>%
  left_join(hdl20072008, by = "respondentid") %>%
  left_join(huq20072008, by = "respondentid") %>%
  left_join(kiq20072008, by = "respondentid") %>%
  left_join(mcq20072008, by = "respondentid") %>%
  left_join(smq20072008, by = "respondentid") %>%
  left_join(smqrtu20072008, by = "respondentid") %>%
  left_join(tchol20072008, by = "respondentid") %>%
  left_join(trigly20072008, by = "respondentid")

# For 2005-2006
alb20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/ALB_CR_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2005-2006`),]$variable[which(na.omit(alb_variables$`2005-2006`) == .x)], 
              .cols = na.omit(alb_variables$`2005-2006`))

biopro20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/BIOPRO_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2005-2006`),]$variable[which(na.omit(biopro_variables$`2005-2006`) == .x)], 
              .cols = na.omit(biopro_variables$`2005-2006`))

bmx20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/BMX_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2005-2006`),]$variable[which(na.omit(bmx_variables$`2005-2006`) == .x)], 
              .cols = na.omit(bmx_variables$`2005-2006`))

bpq20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/BPQ_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2005-2006`),]$variable[which(na.omit(bpq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(bpq_variables$`2005-2006`))

bpx20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/BPX_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2005-2006`),]$variable[which(na.omit(bpxo_variables$`2005-2006`) == .x)], 
              .cols = na.omit(bpxo_variables$`2005-2006`))

cdq20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/CDQ_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2005-2006`),]$variable[which(na.omit(cdq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(cdq_variables$`2005-2006`))

demo20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/DEMO_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2005-2006`),]$variable[which(na.omit(demo_variables$`2005-2006`) == .x)], 
              .cols = na.omit(demo_variables$`2005-2006`))

diq20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/DIQ_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2005-2006`),]$variable[which(na.omit(diq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(diq_variables$`2005-2006`))

ghb20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/GHB_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2005-2006`),]$variable[which(na.omit(ghb_variables$`2005-2006`) == .x)], 
              .cols = na.omit(ghb_variables$`2005-2006`))

glu20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/GLU_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2005-2006`),]$variable[which(na.omit(glu_variables$`2005-2006`) == .x)], 
              .cols = na.omit(glu_variables$`2005-2006`))

hdl20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/HDL_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2005-2006`),]$variable[which(na.omit(hdl_variables$`2005-2006`) == .x)], 
              .cols = na.omit(hdl_variables$`2005-2006`))

huq20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/HUQ_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2005-2006`),]$variable[which(na.omit(huq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(huq_variables$`2005-2006`))

kiq20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/KIQ_U_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2005-2006`),]$variable[which(na.omit(kiq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(kiq_variables$`2005-2006`))

mcq20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/MCQ_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2005-2006`),]$variable[which(na.omit(mcq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(mcq_variables$`2005-2006`))

smq20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/SMQ_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2005-2006`),]$variable[which(na.omit(smq_variables$`2005-2006`) == .x)], 
              .cols = na.omit(smq_variables$`2005-2006`))

smqrtu20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/SMQRTU_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2005-2006`),]$variable[which(na.omit(smqrtu_variables$`2005-2006`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2005-2006`))

tchol20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/TCHOL_D.XPT") %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2005-2006`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2005-2006`),]$variable[which(na.omit(tchol_variables$`2005-2006`) == .x)], 
              .cols = na.omit(tchol_variables$`2005-2006`))

trigly20052006 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2005-2006/TRIGLY_D.XPT") %>%
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
  left_join(ghb20052006, by = "respondentid") %>%
  left_join(glu20052006, by = "respondentid") %>%
  left_join(hdl20052006, by = "respondentid") %>%
  left_join(huq20052006, by = "respondentid") %>%
  left_join(kiq20052006, by = "respondentid") %>%
  left_join(mcq20052006, by = "respondentid") %>%
  left_join(smq20052006, by = "respondentid") %>%
  left_join(smqrtu20052006, by = "respondentid") %>%
  left_join(tchol20052006, by = "respondentid") %>%
  left_join(trigly20052006, by = "respondentid")

# For 2003-2004
alb20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/L16_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2003-2004`),]$variable[which(na.omit(alb_variables$`2003-2004`) == .x)], 
              .cols = na.omit(alb_variables$`2003-2004`))

biopro20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/L40_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2003-2004`),]$variable[which(na.omit(biopro_variables$`2003-2004`) == .x)], 
              .cols = na.omit(biopro_variables$`2003-2004`))

bmx20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/BMX_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2003-2004`),]$variable[which(na.omit(bmx_variables$`2003-2004`) == .x)], 
              .cols = na.omit(bmx_variables$`2003-2004`))

bpq20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/BPQ_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2003-2004`),]$variable[which(na.omit(bpq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(bpq_variables$`2003-2004`))

bpx20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/BPX_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2003-2004`),]$variable[which(na.omit(bpxo_variables$`2003-2004`) == .x)], 
              .cols = na.omit(bpxo_variables$`2003-2004`))

cdq20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/CDQ_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2003-2004`),]$variable[which(na.omit(cdq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(cdq_variables$`2003-2004`))

demo20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/DEMO_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2003-2004`),]$variable[which(na.omit(demo_variables$`2003-2004`) == .x)], 
              .cols = na.omit(demo_variables$`2003-2004`))

diq20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/DIQ_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2003-2004`),]$variable[which(na.omit(diq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(diq_variables$`2003-2004`))

ghb20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/L10_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2003-2004`),]$variable[which(na.omit(ghb_variables$`2003-2004`) == .x)], 
              .cols = na.omit(ghb_variables$`2003-2004`))

glu20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/L10AM_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2003-2004`),]$variable[which(na.omit(glu_variables$`2003-2004`) == .x)], 
              .cols = na.omit(glu_variables$`2003-2004`))

hdl20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/L13_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2003-2004`),]$variable[which(na.omit(hdl_variables$`2003-2004`) == .x)], 
              .cols = na.omit(hdl_variables$`2003-2004`))

huq20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/HUQ_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2003-2004`),]$variable[which(na.omit(huq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(huq_variables$`2003-2004`))

kiq20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/KIQ_U_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2003-2004`),]$variable[which(na.omit(kiq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(kiq_variables$`2003-2004`))

mcq20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/MCQ_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2003-2004`),]$variable[which(na.omit(mcq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(mcq_variables$`2003-2004`))

smq20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/SMQ_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2003-2004`),]$variable[which(na.omit(smq_variables$`2003-2004`) == .x)], 
              .cols = na.omit(smq_variables$`2003-2004`))

smqrtu20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/SMQMEC_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2003-2004`),]$variable[which(na.omit(smqrtu_variables$`2003-2004`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2003-2004`))

trigly20032004 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2003-2004/L13AM_C.XPT") %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2003-2004`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2003-2004`),]$variable[which(na.omit(trigly_variables$`2003-2004`) == .x)], 
              .cols = na.omit(trigly_variables$`2003-2004`))

# Perform the joins
nhanes_20032004 <- alb20032004 %>%
  left_join(biopro20032004, by = "respondentid") %>%
  left_join(bmx20032004, by = "respondentid") %>%
  left_join(bpq20032004, by = "respondentid") %>%
  left_join(bpx20032004, by = "respondentid") %>%
  left_join(cdq20032004, by = "respondentid") %>%
  left_join(demo20032004, by = "respondentid") %>%
  left_join(diq20032004, by = "respondentid") %>%
  left_join(ghb20032004, by = "respondentid") %>%
  left_join(glu20032004, by = "respondentid") %>%
  left_join(hdl20032004, by = "respondentid") %>%
  left_join(huq20032004, by = "respondentid") %>%
  left_join(kiq20032004, by = "respondentid") %>%
  left_join(mcq20032004, by = "respondentid") %>%
  left_join(smq20032004, by = "respondentid") %>%
  left_join(smqrtu20032004, by = "respondentid") %>%
  left_join(trigly20032004, by = "respondentid")

# For 2001-2002
alb20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/L16_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`2001-2002`),]$variable[which(na.omit(alb_variables$`2001-2002`) == .x)], 
              .cols = na.omit(alb_variables$`2001-2002`))

biopro20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/L40_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`2001-2002`),]$variable[which(na.omit(biopro_variables$`2001-2002`) == .x)], 
              .cols = na.omit(biopro_variables$`2001-2002`))

bmx20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/BMX_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2001-2002`),]$variable[which(na.omit(bmx_variables$`2001-2002`) == .x)], 
              .cols = na.omit(bmx_variables$`2001-2002`))

bpq20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/BPQ_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2001-2002`),]$variable[which(na.omit(bpq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(bpq_variables$`2001-2002`))

bpx20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/BPX_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2001-2002`),]$variable[which(na.omit(bpxo_variables$`2001-2002`) == .x)], 
              .cols = na.omit(bpxo_variables$`2001-2002`))

cdq20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/CDQ_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`2001-2002`),]$variable[which(na.omit(cdq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(cdq_variables$`2001-2002`))

demo20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/DEMO_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2001-2002`),]$variable[which(na.omit(demo_variables$`2001-2002`) == .x)], 
              .cols = na.omit(demo_variables$`2001-2002`))

diq20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/DIQ_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2001-2002`),]$variable[which(na.omit(diq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(diq_variables$`2001-2002`))

ghb20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/L10_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2001-2002`),]$variable[which(na.omit(ghb_variables$`2001-2002`) == .x)], 
              .cols = na.omit(ghb_variables$`2001-2002`))

glu20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/L10AM_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2001-2002`),]$variable[which(na.omit(glu_variables$`2001-2002`) == .x)], 
              .cols = na.omit(glu_variables$`2001-2002`))

hdl20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/L13_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2001-2002`),]$variable[which(na.omit(hdl_variables$`2001-2002`) == .x)], 
              .cols = na.omit(hdl_variables$`2001-2002`))

huq20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/HUQ_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2001-2002`),]$variable[which(na.omit(huq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(huq_variables$`2001-2002`))

kiq20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/KIQ_U_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2001-2002`),]$variable[which(na.omit(kiq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(kiq_variables$`2001-2002`))

mcq20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/MCQ_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2001-2002`),]$variable[which(na.omit(mcq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(mcq_variables$`2001-2002`))

smq20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/SMQ_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2001-2002`),]$variable[which(na.omit(smq_variables$`2001-2002`) == .x)], 
              .cols = na.omit(smq_variables$`2001-2002`))

smqrtu20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/SMQMEC_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2001-2002`),]$variable[which(na.omit(smqrtu_variables$`2001-2002`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2001-2002`))

trigly20012002 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/2001-2002/L13AM_B.XPT") %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`2001-2002`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`2001-2002`),]$variable[which(na.omit(trigly_variables$`2001-2002`) == .x)], 
              .cols = na.omit(trigly_variables$`2001-2002`))

# Perform the joins
nhanes_20012002 <- alb20012002 %>%
  left_join(biopro20012002, by = "respondentid") %>%
  left_join(bmx20012002, by = "respondentid") %>%
  left_join(bpq20012002, by = "respondentid") %>%
  left_join(bpx20012002, by = "respondentid") %>%
  left_join(cdq20012002, by = "respondentid") %>%
  left_join(demo20012002, by = "respondentid") %>%
  left_join(diq20012002, by = "respondentid") %>%
  left_join(ghb20012002, by = "respondentid") %>%
  left_join(glu20012002, by = "respondentid") %>%
  left_join(hdl20012002, by = "respondentid") %>%
  left_join(huq20012002, by = "respondentid") %>%
  left_join(kiq20012002, by = "respondentid") %>%
  left_join(mcq20012002, by = "respondentid") %>%
  left_join(smq20012002, by = "respondentid") %>%
  left_join(smqrtu20012002, by = "respondentid") %>%
  left_join(trigly20012002, by = "respondentid")

# For 1999-2000
alb19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/LAB16.XPT") %>%
  # Select columns
  select(all_of(na.omit(alb_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ alb_variables[!is.na(alb_variables$`1999-2000`),]$variable[which(na.omit(alb_variables$`1999-2000`) == .x)], 
              .cols = na.omit(alb_variables$`1999-2000`))

biopro19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/LAB18.XPT") %>%
  # Select columns
  select(all_of(na.omit(biopro_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ biopro_variables[!is.na(biopro_variables$`1999-2000`),]$variable[which(na.omit(biopro_variables$`1999-2000`) == .x)], 
              .cols = na.omit(biopro_variables$`1999-2000`))

bmx19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/BMX.XPT") %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`1999-2000`),]$variable[which(na.omit(bmx_variables$`1999-2000`) == .x)], 
              .cols = na.omit(bmx_variables$`1999-2000`))

bpq19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/BPQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`1999-2000`),]$variable[which(na.omit(bpq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(bpq_variables$`1999-2000`))

bpx19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/BPX.XPT") %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`1999-2000`),]$variable[which(na.omit(bpxo_variables$`1999-2000`) == .x)], 
              .cols = na.omit(bpxo_variables$`1999-2000`))

cdq19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/CDQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(cdq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ cdq_variables[!is.na(cdq_variables$`1999-2000`),]$variable[which(na.omit(cdq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(cdq_variables$`1999-2000`))

demo19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/DEMO.XPT") %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`1999-2000`),]$variable[which(na.omit(demo_variables$`1999-2000`) == .x)], 
              .cols = na.omit(demo_variables$`1999-2000`))

diq19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/DIQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`1999-2000`),]$variable[which(na.omit(diq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(diq_variables$`1999-2000`))

ghb19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/LAB10.XPT") %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`1999-2000`),]$variable[which(na.omit(ghb_variables$`1999-2000`) == .x)], 
              .cols = na.omit(ghb_variables$`1999-2000`))

glu19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/LAB10AM.XPT") %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`1999-2000`),]$variable[which(na.omit(glu_variables$`1999-2000`) == .x)], 
              .cols = na.omit(glu_variables$`1999-2000`))

hdl19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/LAB13.XPT") %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`1999-2000`),]$variable[which(na.omit(hdl_variables$`1999-2000`) == .x)], 
              .cols = na.omit(hdl_variables$`1999-2000`))

huq19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/HUQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`1999-2000`),]$variable[which(na.omit(huq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(huq_variables$`1999-2000`))

kiq19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/KIQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`1999-2000`),]$variable[which(na.omit(kiq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(kiq_variables$`1999-2000`))

mcq19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/MCQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`1999-2000`),]$variable[which(na.omit(mcq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(mcq_variables$`1999-2000`))

smq19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/SMQ.XPT") %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`1999-2000`),]$variable[which(na.omit(smq_variables$`1999-2000`) == .x)], 
              .cols = na.omit(smq_variables$`1999-2000`))

smqrtu19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/SMQMEC.XPT") %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`1999-2000`),]$variable[which(na.omit(smqrtu_variables$`1999-2000`) == .x)], 
              .cols = na.omit(smqrtu_variables$`1999-2000`))

trigly19992000 <- read_xpt("/Users/krishnasanaka/Desktop/Public Health Research/CKM/Datasets/1999-2000/LAB13AM.XPT") %>%
  # Select columns
  select(all_of(na.omit(trigly_variables$`1999-2000`))) %>%
  # Rename columns
  rename_with(~ trigly_variables[!is.na(trigly_variables$`1999-2000`),]$variable[which(na.omit(trigly_variables$`1999-2000`) == .x)], 
              .cols = na.omit(trigly_variables$`1999-2000`))

# Perform the joins
nhanes_19992000 <- alb19992000 %>%
  left_join(biopro19992000, by = "respondentid") %>%
  left_join(bmx19992000, by = "respondentid") %>%
  left_join(bpq19992000, by = "respondentid") %>%
  left_join(bpx19992000, by = "respondentid") %>%
  left_join(cdq19992000, by = "respondentid") %>%
  left_join(demo19992000, by = "respondentid") %>%
  left_join(diq19992000, by = "respondentid") %>%
  left_join(ghb19992000, by = "respondentid") %>%
  left_join(glu19992000, by = "respondentid") %>%
  left_join(hdl19992000, by = "respondentid") %>%
  left_join(huq19992000, by = "respondentid") %>%
  left_join(kiq19992000, by = "respondentid") %>%
  left_join(mcq19992000, by = "respondentid") %>%
  left_join(smq19992000, by = "respondentid") %>%
  left_join(smqrtu19992000, by = "respondentid") %>%
  left_join(trigly19992000, by = "respondentid")

# Saving the combined NHANES data sets as RDS files:
saveRDS(nhanes_19992000, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_19992000.rds")

saveRDS(nhanes_20012002, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_20012002.rds")

saveRDS(nhanes_20032004, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_20032004.rds")

saveRDS(nhanes_20052006, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_20052006.rds")

saveRDS(nhanes_20072008, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_20072008.rds")

saveRDS(nhanes_20092010, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_20092010.rds")

saveRDS(nhanes_20112012, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_20112012.rds")

saveRDS(nhanes_20132014, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_20132014.rds")

saveRDS(nhanes_20152016, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_20152016.rds")

saveRDS(nhanes_20172018, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_20172018.rds")

saveRDS(nhanes_2017Mar2020, file = "/Users/krishnasanaka/Desktop/Public Health Research/CKM/NHANES RDS/nhanes_2017Mar2020.rds")

rm(list = ls())
