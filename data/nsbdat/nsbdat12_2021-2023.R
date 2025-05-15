
rm(list=ls());gc();source(".Rprofile")

source("data/nsbdat/nsbdat_read all variable lists.R")


# Loading in the 2021-2023 datasets:
bmx20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/BMX_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bmx_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ bmx_variables[!is.na(bmx_variables$`2021-2023`),]$variable[which(na.omit(bmx_variables$`2021-2023`) == .x)], 
              .cols = na.omit(bmx_variables$`2021-2023`))

bpq20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/BPQ_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpq_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ bpq_variables[!is.na(bpq_variables$`2021-2023`),]$variable[which(na.omit(bpq_variables$`2021-2023`) == .x)], 
              .cols = na.omit(bpq_variables$`2021-2023`))

bpxo20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/BPXO_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(bpxo_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ bpxo_variables[!is.na(bpxo_variables$`2021-2023`),]$variable[which(na.omit(bpxo_variables$`2021-2023`) == .x)], 
              .cols = na.omit(bpxo_variables$`2021-2023`))

demo20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/DEMO_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(demo_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ demo_variables[!is.na(demo_variables$`2021-2023`),]$variable[which(na.omit(demo_variables$`2021-2023`) == .x)], 
              .cols = na.omit(demo_variables$`2021-2023`))

diq20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/DIQ_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(diq_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ diq_variables[!is.na(diq_variables$`2021-2023`),]$variable[which(na.omit(diq_variables$`2021-2023`) == .x)], 
              .cols = na.omit(diq_variables$`2021-2023`))

ghb20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/GHB_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ghb_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ ghb_variables[!is.na(ghb_variables$`2021-2023`),]$variable[which(na.omit(ghb_variables$`2021-2023`) == .x)], 
              .cols = na.omit(ghb_variables$`2021-2023`))

glu20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/GLU_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(glu_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ glu_variables[!is.na(glu_variables$`2021-2023`),]$variable[which(na.omit(glu_variables$`2021-2023`) == .x)], 
              .cols = na.omit(glu_variables$`2021-2023`))

hdl20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/HDL_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hdl_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ hdl_variables[!is.na(hdl_variables$`2021-2023`),]$variable[which(na.omit(hdl_variables$`2021-2023`) == .x)], 
              .cols = na.omit(hdl_variables$`2021-2023`))

hscrp20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/HSCRP_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(hscrp_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ hscrp_variables[!is.na(hscrp_variables$`2021-2023`),]$variable[which(na.omit(hscrp_variables$`2021-2023`) == .x)], 
              .cols = na.omit(hscrp_variables$`2021-2023`))

huq20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/HUQ_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(huq_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ huq_variables[!is.na(huq_variables$`2021-2023`),]$variable[which(na.omit(huq_variables$`2021-2023`) == .x)], 
              .cols = na.omit(huq_variables$`2021-2023`))

ins20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/INS_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(ins_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ ins_variables[!is.na(ins_variables$`2021-2023`),]$variable[which(na.omit(ins_variables$`2021-2023`) == .x)], 
              .cols = na.omit(ins_variables$`2021-2023`))

kiq20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/KIQ_U_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(kiq_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ kiq_variables[!is.na(kiq_variables$`2021-2023`),]$variable[which(na.omit(kiq_variables$`2021-2023`) == .x)], 
              .cols = na.omit(kiq_variables$`2021-2023`))

mcq20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/MCQ_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(mcq_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ mcq_variables[!is.na(mcq_variables$`2021-2023`),]$variable[which(na.omit(mcq_variables$`2021-2023`) == .x)], 
              .cols = na.omit(mcq_variables$`2021-2023`))

rxqasa20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/RXQASA_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(rxqasa_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ rxqasa_variables[!is.na(rxqasa_variables$`2021-2023`),]$variable[which(na.omit(rxqasa_variables$`2021-2023`) == .x)], 
              .cols = na.omit(rxqasa_variables$`2021-2023`))

smq20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/SMQ_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smq_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ smq_variables[!is.na(smq_variables$`2021-2023`),]$variable[which(na.omit(smq_variables$`2021-2023`) == .x)], 
              .cols = na.omit(smq_variables$`2021-2023`))

smqrtu20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/SMQRTU_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(smqrtu_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ smqrtu_variables[!is.na(smqrtu_variables$`2021-2023`),]$variable[which(na.omit(smqrtu_variables$`2021-2023`) == .x)], 
              .cols = na.omit(smqrtu_variables$`2021-2023`))

tchol20212023 <- read_xpt(paste0(path_nhanes_nsb_raw,"/2021-2023/TCHOL_L.XPT")) %>%
  # Select columns
  select(all_of(na.omit(tchol_variables$`2021-2023`))) %>%
  # Rename columns
  rename_with(~ tchol_variables[!is.na(tchol_variables$`2021-2023`),]$variable[which(na.omit(tchol_variables$`2021-2023`) == .x)], 
              .cols = na.omit(tchol_variables$`2021-2023`))

# Perform the joins
nhanes_20212023 <- bmx20212023 %>%
  left_join(bpq20212023, by = "respondentid") %>%
  left_join(bpxo20212023, by = "respondentid") %>%
  left_join(demo20212023, by = "respondentid") %>%
  left_join(diq20212023, by = "respondentid") %>%
  left_join(ghb20212023, by = "respondentid") %>%
  left_join(glu20212023, by = "respondentid") %>%
  left_join(hdl20212023, by = "respondentid") %>%
  left_join(hscrp20212023, by = "respondentid") %>%
  left_join(huq20212023, by = "respondentid") %>%
  left_join(ins20212023, by = "respondentid") %>%
  left_join(kiq20212023, by = "respondentid") %>%
  left_join(mcq20212023, by = "respondentid") %>%
  left_join(rxqasa20212023, by = "respondentid") %>%
  left_join(smq20212023, by = "respondentid") %>%
  left_join(smqrtu20212023, by = "respondentid") %>%
  left_join(tchol20212023, by = "respondentid")

saveRDS(nhanes_20212023, file = paste0(path_nhanes_nsb_cleaned,"/nhanes_20212023.rds"))

rm(list = ls())

