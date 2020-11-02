# ChIP-Seq_GViz

Date: 11/01/2020

----

## 1. Data source

![]()

<a href="https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE107236"  _target="blank">GSE107236</a>

## 2.  Extract genomic location for the track

```shell
bedtools intersect -wa -a GSM2863140_Input_NO8_24_mm9.bedGraph -b Igll1.bed> 0_EBF1_Igll1.bedgraph
bedtools intersect -wa -a GSM2863147_EBF1_NO14_24_mm9.bedGraph -b Igll1.bed> 24_EBF1_Igll1.bedgraph
bedtools intersect -wa -a GSM2863148_EBF1_NO14_72_mm9.bedGraph -b Igll1.bed> 72_EBF1_Igll1.bedgraph
bedtools intersect -wa -a GSM2863149_EBF1_NO14_cd19pos_mm9.bedGraph -b Igll1.bed> proB_EBF1_Igll1.bedgraph

grep Igll1 gencode.vM9.annotation.gtf | grep ENSMUST00000124649.1 |grep exon | awk '{print $4,$5,$3}' OFS="\t" > Igll1.gene.txt
```

## 3. Draw the graph

<a href="https://github.com/cmutd/ChIP-Seq_GViz/tree/main/code"  _target="blank"> Code</a>



## 4. Visualization

![](https://github.com/cmutd/ChIP-Seq_GViz/blob/main/figure/chip_gviz.png)
