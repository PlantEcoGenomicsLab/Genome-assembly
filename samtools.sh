samtools view -S -b aln_CZoysii_hap1.sam > aln_CZoysii_hap1.bam
 
samtools view aln_CZoysii_hap1.bam | head
samtools sort aln_CZoysii_hap1.bam -o aln_CZoysii_hap1.sorted.bam &
samtools index aln_CZoysii_hap1.sorted.bam &
samtools view aln_CZoysii_hap1.sorted.bam | head
 
#count the total number of alignments
samtools view aln_CZoysii_hap1.sorted.bam | wc -l
