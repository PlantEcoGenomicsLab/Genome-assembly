#indexing the assebly
minimap2 -d CZoysii_purgedups2.asm.bp.hap1.p_ctg.fasta.mmi /cluster/home/fdalgrande/campanula_rhizobotria/TBG_data/TBG_4752/CZoysii_purgedups2.asm.bp.hap1.p_ctg.fasta

#aligning assembled reads to raw reads (subreads.bam/fastq in case of pacbio)
minimap2 -ax map-pb  /cluster/home/fdalgrande/campanula_rhizobotria/TBG_data/TBG_4752/CZoysii_purgedups2.asm.bp.hap1.p_ctg.fasta /cluster/home/fdalgrande/campanula_rhizobotria/TBG_data/TBG_4752/PBLIP_Camanula_Zoysii_final_m84155_231023_122102_s3.hifi_reads.fq > aln_CZoysii_hap1.sam   #for PacBio subreads
