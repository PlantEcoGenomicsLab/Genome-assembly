#SBATCH --job-name=blobtoolkit
#SBATCH --error %x-%j.err
#SBATCH --output %x-%j.out
#SBATCH --partition=cpu
#SBATCH --mem=350G
#SBATCH --cpus-per-task=40

module load blobtoolkit

#adding coverage files
blobtools add --cov aln_CZoysii_hap1.sorted.bam BlobDir_Czoysii_assembly &

#adding busco
blobtools add --busco busco_full_table_Czoysii_hap1.tsv BlobDir_Czoysii_assembly &

#adding blastn
blobtools add --hits c_zoysii_hap1.diamond.out --taxdump /cluster/home/fdalgrande/campanula_rhizobotria/TBG_data/TBG_4752/blobtools/taxdump BlobDir_Czoysii_assembly &
