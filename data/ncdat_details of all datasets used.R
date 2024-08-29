rm(list=ls());gc();source(".Rprofile")

data.frame(file_name = list.files(paste0(path_nhanes_ckm_raw),
                                  all.files = TRUE,full.names = FALSE,recursive = TRUE)) %>% 
  separate(.,col="file_name",into=c("years","file"),sep="/") %>% 
  write.csv(.,"data/details of all datasets used.csv")

