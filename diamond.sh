##create the 
#if you are working in Homelander this step is not necessary as the sprot.fasta.taxlist.gz is already present
perl -lane 'if(/^>sp\|(\w+)\|\w+\s.*OX=(\d+)/){print "$1 $2"}' uniprot_sprot.fasta | gzip > uniprot_sprot.taxlist.gz

module load diamond

#if you are working in Homelander this step is not necessary as the uniprot_sprot.taxids.dmnd is already present
diamond makedb --in /home/apasinato/databases/uniprot_sprot.fasta --taxonmap /home/apasinato/databases/sprot.fasta.taxlist.gz --taxonnodes ../taxdump/nodes.dmp -d uniprot_sprot.taxids.dmnd

diamond blastx 
        --query ASSEMBLY_NAME.fasta \
        --db /path/to/uniprot_sprot.taxids.dmnd \
        --outfmt 6 qseqid staxids bitscore qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore \
        --sensitive \
        --max-target-seqs 5 \
        --evalue 1e-25 \
        --threads 16 \
        > ASSEMBLY_NAME.diamond.blastx.out
