gene_axis_theme <- theme(
  axis.text.x=element_blank(),
  axis.ticks.x=element_blank(),
  axis.line.x=element_blank(),
  axis.text.y=element_blank(),
  axis.ticks.y=element_blank(),
  axis.line.y=element_blank()
)

track_axis_theme <- theme(
  axis.text.x=element_blank(),
  axis.ticks.x=element_blank(),
  axis.line.x=element_blank()
)


tract <-function(sample, start,end,color,fill){
  graph <- ggplot(sample)+
    geom_line(aes((V2+V3)/2,V4),color=color)+
    geom_area(aes((V2+V3)/2,V4),fill=fill,alpha=.5)+
    theme_classic()+
    labs(x="",y="")+
    coord_cartesian(xlim=c(start,end),ylim=c(0,170))+
    track_axis_theme
  
}
