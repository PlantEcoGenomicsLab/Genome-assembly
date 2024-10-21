# Genome-assembly
This is a descriptional workflow comprehensive of pipelines and code used to assemble Campanula zoysii reference genome. It can be used and adapted for other plent reference genomes.
## Binning
For cleaning the assembly from unwanted contaminants genome binning was perfomed in the following steps:
1. Create a diamond database, in our case we used the complete Swiss-prot database (good balance between sensitvity and specificity).
2. Run `diamond.sh` on our draft assembly
