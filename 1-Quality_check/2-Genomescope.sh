#!/bin/bash
conda activate pandas

#K-mer histogram
FastK -v -t4 -k21 -M30 -T4 HiFi_reads.quality_fil.fastq -NSpecies

#look at a k-mer spectra
Histex -G Species > Species_k21.hist

#Genomescope 2.0
module load R
/home/dalgrande_lab_workspace/tools/genomescope2.0/genomescope.R -i Species_k21.hist -o Genomescope_k21 -k 21 
#you can add a flag -p and the level of ploidy if you already know, default is 2

