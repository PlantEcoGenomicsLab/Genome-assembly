#protip: if you are running blobtoolkit form homelander first activate conda btk environment
conda activate btk

module load blobtoolkit
blobtools create --fasta CZoysii_purgedups2.asm.bp.hap1.p_ctg.fasta &

#adding coverage files
blobtools add --cov aln_CZoysii_hap1.sorted.bam BlobDir_Czoysii_assembly &

#adding busco
blobtools add --busco busco_full_table_Czoysii_hap1.tsv BlobDir_Czoysii_assembly &

#adding diamond
blobtools add --hits c_zoysii_hap1.diamond.out --taxdump /cluster/home/fdalgrande/campanula_rhizobotria/TBG_data/TBG_4752/blobtools/taxdump BlobDir_Czoysii_assembly &
