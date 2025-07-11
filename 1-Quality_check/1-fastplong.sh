#!/bin/bash

conda activate pbtk

#transform bam file in fastq reads
bam2fastq HiFi_reads.bam \
 -o HiFi_reads &

#run Fastplong
fastplong -i HiFi_reads.fastq -o HiFi_reads.quality_fil.fastq --failed_out HiFi_reads.failed_reads --distance_threshold 0.10 --length_required 1000
