manhattanPlot = function(pvalue,bp,chr,
                         ylab=expression(-log[10](P)),
                         cutoffline=T,
                         chrLabel = 1:22){
  pvalue = -log10(pvalue)
  pvalue = ifelse(pvalue<0,0,pvalue)
  bpMidVec <- vector(length=length(chrLabel))
  maxbp = 0
  bmin = vector(length=length(chrLabel))
  bmax = vector(length=length(chrLabel))
  for(i in chrLabel){
    bp[chr==i] = bp[chr==i] + maxbp
    bmin[i] = min(bp[chr==i])
    bmax[i] = max(bp[chr==i])
    bpMidVec[i] <- ((max(bp[chr==i]) - min(bp[chr==i]))/2) + min(bp[chr==i])
    maxbp = max(bp[chr==i])
  }
  chr = factor(chr)
  yLabel = round(c(0,1,-log10(0.05),2:max(pvalue)),digits = 2)
  p = ggplot() + 
    geom_rect(data = data.frame(bmin,bmax,alpha=0.01),
              aes(xmin=bmin,xmax=bmax,alpha=alpha),
              ymin=0,
              ymax=Inf,
              fill = rep(c("grey90","white"),11),
              size = 0
    ) + 
    geom_point(data = data.frame(P=pvalue,BP=bp,CHR=chr),aes(y=P,x=BP,colour=CHR),alpha=0.8) +
    ylim(0,1.1*max(pvalue)) +
    scale_x_continuous(labels=as.character(chrLabel), breaks=bpMidVec) +
    scale_y_continuous(labels=as.character(yLabel), breaks=yLabel) +
    scale_color_manual(values=rep(c('orange1', 'grey20'), 11)) +
    theme_bw() +
    theme(
      panel.grid=element_blank()
    ) +
    xlab("Chromosomal Location") +
    ylab(ylab) +
    theme(legend.position='none')
  if (cutoffline){
    p = p + geom_hline(y=-log10(0.05), linetype=1, col='red', lwd=1) 
  }
  p
}




