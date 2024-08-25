rm(list=ls());gc();source(".Rprofile")

#Raw data downloaded from https://www.cdc.gov/nchs/data-linkage/mortality-public.htm
# Example code from https://www.cdc.gov/nchs/data-linkage/mortality-public.htm

mortality_files = list.files(paste0(path_nhanes_ckm_folder,"/working/raw"),recursive = TRUE) %>% 
  .[str_detect(.,"MORT_2019_PUBLIC")]


mortality_data = map_dfr(mortality_files,
                         function(m_f){
                           
                           # read in the fixed-width format ASCII file
                           dsn <- read_fwf(file=paste0(path_nhanes_ckm_folder,"/working/raw/",m_f),
                                           col_types = "iiiiiiii",
                                           fwf_cols(seqn = c(1,6),
                                                    eligstat = c(15,15),
                                                    mortstat = c(16,16),
                                                    ucod_leading = c(17,19),
                                                    diabetes = c(20,20),
                                                    hyperten = c(21,21),
                                                    permth_int = c(43,45),
                                                    permth_exm = c(46,48)
                                           ),
                                           na = c("", ".")
                           ) %>% 
                             mutate(file_name = m_f,
                                    year = str_extract(m_f,"^([0-9]|\\-)+"))
                           
                         })


saveRDS(mortality_data,paste0(path_nhanes_ckm_folder,"/working/cleaned/ncdat12_ndi linked mortality data.RDS"))



