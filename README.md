# Common-Workflow-Language
CWL Scripts for RNAseq pipeline execution

Steps involved:

#!/bin/bash


prefetch "{SAMPLE}";   #Fetch the .sra file

fastq-dump --split-files "{SAMPLE}";    # .sra to .fastq

fastqc *.fastq      # FastQC

hisat2 -p 40 --rg-id=sample --rg SM:sample --rg LB:sample --rg PL:ILLUMINA --rg PU:sample.1 -x $HG38_REF/hg38 --dta -1 "{SAMPLE}"_1.fastq -2 "{SAMPLE}"_2.fastq  -S "${SAMPLE}".sam;     # Hisat2 Alignment

samtools sort -@ 40 -o "{SAMPLE}".bam "{SAMPLE}".sam;    #Samtools sort

stringtie -p 40 -G $HG38_REF/hg38.gtf -e -B -o "{SAMPLE}"/transcripts.gtf -A "{SAMPLE}"/gene_ab_"{SAMPLE}".tsv "{SAMPLE}".bam;    #Abundance Quantification 
