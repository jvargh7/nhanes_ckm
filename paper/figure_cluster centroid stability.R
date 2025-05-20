rm(list=ls()); gc(); source(".Rprofile")

source("analysis/ncan_analytic sample for survival.R")

analytic_sample <- analytic_sample %>% 
  mutate(cluster = factor(cluster,levels=c("SIDD","SIRD","MOD","MARD")))


cc_A = analytic_sample %>% 
  ggplot(data=.,aes(y=glycohemoglobin,x=cluster,group=interaction(year,cluster),fill=cluster)) +
  geom_boxplot() +
  xlab("") +
  ylab("HbA1c (%)") +
  scale_y_continuous(limits=c(0,20),breaks=seq(0,20,by=5)) +
  theme_bw() +
  scale_fill_manual(name="",values=cluster_colors_cosmos_all)

cc_B = analytic_sample %>% 
  ggplot(data=.,aes(y=bmi,x=cluster,group=interaction(year,cluster),fill=cluster)) +
  geom_boxplot() +
  xlab("") +
  ylab(bquote('BMI ( kg' /m^2~')')) +
  scale_y_continuous(limits=c(0,80),breaks=seq(0,80,by=20)) +
  theme_bw() +
  scale_fill_manual(name="",values=cluster_colors_cosmos_all)

cc_C = analytic_sample %>% 
  ggplot(data=.,aes(y=age,x=cluster,group=interaction(year,cluster),fill=cluster)) +
  geom_boxplot() +
  xlab("") +
  ylab("Age at diagnosis (year)") +
  scale_y_continuous(limits=c(0,100),breaks=seq(0,100,by=20)) +
  theme_bw() + 
  scale_fill_manual(name="",values=cluster_colors_cosmos_all)

cc_D = analytic_sample %>% 
  ggplot(data=.,aes(y=homa2b,x=cluster,group=interaction(year,cluster),fill=cluster)) +
  geom_boxplot() +
  xlab("") +
  ylab("HOMA2 B (%)") +
  scale_y_continuous(limits=c(0,350),breaks=seq(0,350,by=50)) +
  theme_bw() +
  scale_fill_manual(name="",values=cluster_colors_cosmos_all)

cc_E = analytic_sample %>% 
  ggplot(data=.,aes(y=homa2ir,x=cluster,group=interaction(year,cluster),fill=cluster)) +
  geom_boxplot() +
  xlab("") +
  ylab("HOMA2 IR (%)") +
  scale_y_continuous(limits=c(0,10),breaks=seq(0,10,by=2.5)) +
  theme_bw() +
  scale_fill_manual(name="",values=cluster_colors_cosmos_all)



library(ggpubr)

ggarrange(cc_A,
          cc_B,
          cc_C,
          cc_D,
          cc_E,
          nrow=2,
          ncol=3,
          common.legend = TRUE,legend = "none") %>% 
  ggsave(.,filename=paste0(path_nhanes_ckm_folder,"/figures/cluster centroid stability.jpg"),width=12,height =8)

