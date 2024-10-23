# Genome-assembly
This is a descriptional workflow comprehensive of pipelines and code used to assemble Campanula zoysii reference genome. It can be used and adapted for other plent reference genomes.
## Binning
For cleaning the assembly from unwanted contaminants genome binning was perfomed with blobtools. 
Blobtools requires: 
- raw assembly (.fna)
- coverage file
- hits file (diamond blastx, blastn)
- busco results (if wanted)

### Hits file
1. Create a diamond database, in our case we used the complete Swiss-prot database (good balance between sensitvity and specificity).
2. Run diamond blastx on the draft assembly (`diamond.sh`)

### Coverage file
The coverage file was created using minimap2 and samtools
1. Index the assembly and align the raw reads to the assembly (`minimap2.sh`)
2. Convert the file to bam format with samtools (`samtools.sh`)

## Blobtools
Run `blobtoolkit.sh`. This will create a folder (BlobDir_Czoysii_assembly/) with all the information needed vor the `view` command
For opening the interactive page:
    blobtools view --remote BlobDir_Czoysii_assembly
To see the result interactive viewer, open a new terminal tab and access remotely with `ssh`, then, keeping the tab open, type the link in any web browser.
