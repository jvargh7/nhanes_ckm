rm(list=ls());gc();source(".Rprofile")

library(ggplot2)

boxplot_df <- read.csv(paste0(path_nhanes_ckm_newdm,"/knn clusters.csv"), header = TRUE, sep = ",") %>%
  dplyr::select("respondentid","cluster", 'bmi','dm_age','glycohemoglobin','homa2b', 'homa2ir') %>% 
  mutate(cluster = factor(cluster,levels=c("SIDD","SIRD","MOD","MARD")))

cluster_colors = cluster_colors_cosmos_all


fig_A = boxplot_df %>% 
  ggplot(data=.,aes(x=cluster,y=glycohemoglobin,fill=cluster)) +
  geom_boxplot(position = position_dodge(width=0.9)) +
  xlab("") +
  ylab("HbA1c (%)") +
  scale_y_continuous(limits=c(0,20),breaks=seq(0,20,by=5)) +
  theme_bw() +
  scale_fill_manual(name="",values=cluster_colors)

fig_B = boxplot_df %>% 
  ggplot(data=.,aes(x=cluster,y=bmi,fill=cluster)) +
  geom_boxplot(position = position_dodge(width=0.9)) +
  xlab("") +
  ylab(bquote('BMI ( kg' /m^2~')')) +
  scale_y_continuous(limits=c(0,80),breaks=seq(0,80,by=20)) +
  theme_bw() +
  scale_fill_manual(name="",values=cluster_colors)

fig_C = boxplot_df %>% 
  ggplot(data=.,aes(x=cluster,y=dm_age,fill=cluster)) +
  geom_boxplot(position = position_dodge(width=0.9)) +
  xlab("") +
  ylab("Age at diagnosis (year)") +
  scale_y_continuous(limits=c(0,100),breaks=seq(0,100,by=20)) +
  theme_bw() +
  scale_fill_manual(name="",values=cluster_colors)

fig_D = boxplot_df %>% 
  ggplot(data=.,aes(x=cluster,y=homa2b,fill=cluster)) +
  geom_boxplot(position = position_dodge(width=0.9)) +
  xlab("") +
  ylab("HOMA2 B (%)") +
  scale_y_continuous(limits=c(0,350),breaks=seq(0,350,by=50)) +
  theme_bw() +
  scale_fill_manual(name="",values=cluster_colors)

fig_E = boxplot_df %>% 
  ggplot(data=.,aes(x=cluster,y=homa2ir,fill=cluster)) +
  geom_boxplot(position = position_dodge(width=0.9)) +
  xlab("") +
  ylab("HOMA2 IR (%)") +
  scale_y_continuous(limits=c(0,40),breaks=seq(0,40,by=5)) +
  theme_bw() +
  scale_fill_manual(name="",values=cluster_colors)



library(ggpubr)

ggarrange(fig_A,
          fig_B,
          fig_C,
          fig_D,
          fig_E,
          nrow=1,
          ncol=5,
          common.legend = TRUE,legend = "none") %>% 
  ggsave(.,filename=paste0(path_nhanes_ckm_folder,"/figures/distribution of clinicalcharacteristics by cluster.jpg"),width=12,height =5.5)


