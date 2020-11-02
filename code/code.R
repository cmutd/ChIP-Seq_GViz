setwd("C://Users//mchen11//Desktop//Fig//figure172")

library(ggplot2)
library(cowplot)
source("track.R")

options(stringsAsFactors = FALSE)


############## ========= step1: read atac-seq bg file ========== ###########
ebf0 <- read.table("0_EBF1_Igll1.bedgraph",head=F)
ebf24 <- read.table("24_EBF1_Igll1.bedgraph",head=F)
ebf72 <- read.table("72_EBF1_Igll1.bedgraph",head=F)
ebf_prob <- read.table("proB_EBF1_Igll1.bedgraph",head=F)


############## ========= step2: generate atac-seq graphs ========== ###########
chip<- list(ebf0,ebf24,ebf72,ebf_prob)
cg <- list()


for (i in 1:4){
  cg[[i]] <- tract(chip[[i]],16858001,16868347,"#D95F02","#D95F02")
   #atac_graph[[i]] <- tract(atac[[i]],16858001,16868347,"#1B9E77","#1B9E77")
}


############## ========= step3: generate gene structure ========== ###########
gene <- read.table("Igll1.gene.txt",head=F)
arrow <- data.frame(x=seq(16860674,16863985,length.out=4)[1:3])
gene_graph <- ggplot()+
  geom_segment(data=arrow,aes(x=16863985,xend=x,y=0,yend=0),
               arrow = arrow(),color="#7570B3")+
  geom_rect(data=gene,aes(xmin=V1,xmax=V2,ymin=-1,ymax=1),
            color="#7570B3",fill="#7570B3",alpha=0.5)+
  coord_cartesian(xlim=c(16858001,16868347))+
  theme_classic()+
  labs(x="",y="")+
  gene_axis_theme


#png("figure/chip_gviz.png", width = 465, height = 225, units='mm', res = 300)
plot_grid(cg[[1]],
          cg[[2]],
          cg[[3]],
          cg[[4]],
          gene_graph,
          ncol=1,
          align="v",
          rel_heights = c(1,1,1,1,0.34))
#dev.off()
          
ggsave("figure/chip_gviz.pdf")
