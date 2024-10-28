#to create the diamond database we downloaded the entire Swiss-prot database (uniprot_sprot.fasta)

#retrieve the taxon IDs and sequence IDs for the mapping file
#if you are working in Homelander this step is not necessary as the sprot.fasta.taxlist.gz is already present
# Create the header for the taxonomic mapping file
echo -e "accession\taccession.version\ttaxid\tgi" > swissprot/swissprot.taxid_map

# extract accession and taxid from Swiss-Prot FASTA headers
cat swissprot/uniprot_sprot.fasta | \
grep "^>" | \
awk -F'[| ]' '/OX=/ {for(i=1;i<=NF;i++) if($i ~ /OX=/) {split($i, a, "="); print $2 "\t" $2 "\t" a[2] "\t0"}}' >> swissprot/swissprot.taxid_map

#create the diamond database using swiss-prot database and mapping file
module load diamond

#if you are working in Homelander this step is not necessary as the uniprot_sprot.taxids.dmnd is already present
/home/apasinato/tools/diamond/diamond makedb \
        --in /home/gsingh/campanula_saxifraga/swissprot/uniprot_sprot.fasta \
        --taxonmap /home/gsingh/campanula_saxifraga/swissprot/swissprot.taxid_map \
        --taxonnodes /home/gsingh/tools/taxdump/nodes.dmp \
        --db swissprot.taxids.dmnd &

#run diamond on the assembly
/home/apasinato/tools/diamond/diamond blastx \
        --query  CZoysii_purgedups2.asm.bp.hap1.p_ctg.fasta \
        --db swissprot.taxids.dmnd \
        --outfmt 6 qseqid staxids bitscore qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue \
        --sensitive \
        --max-target-seqs 5 \
        --evalue 1e-25 \
        --threads 16 \
        > c_zoysii_hap1.diamond.out &
