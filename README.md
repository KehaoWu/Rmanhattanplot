# Rmanhattanplot
>
本代码用于做曼哈顿图。曼哈顿图一般用于在GWAS中集中展示全基因组p值。

> 
We provide codes to plot manhattan plot which is commonly used to display p values from GWAS.

## 安装 / Installation
  
```R  
install.packages("devtools")
devtools::install_github("KehaoWu/Rmanhattanplot")
```

## 使用 / Usage

应提供全基因组数据：p值、染色体物理位置和染色体编号

如：

```R
# 以下代码仅提供示例数据，不要在真实的环境中运行
pvalue = runif(100)
bp = sample(10000:20000,100)
chr = sample(1:22,100,replace=T)
> head(pvalue)
[1] 0.34011080 0.58690499 0.55647674 0.85494148 0.07878192 0.46782922
> head(bp)
[1] 10805 13579 19443 10023 19322 18355
> head(chr)
[1]  2  9 11 19  8 20

# 提供类似的数据运行以下代码
library(Rmanhattanplot)
p = manhattanPlot(pvalue = pvalue,bp = bp,chr = chr,cutoffline = T)
plot(p) #返回gglot2对象
```

!["Manhattan Plot"](Demo/ "Manhattan Plot")

