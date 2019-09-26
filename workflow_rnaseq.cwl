#!/usr/bin/env cwl-runner
class: Workflow
cwlVersion: v1.0
inputs:
  sraFiles:
    type: File
  split:
    type: boolean
  reference_file:
    type: File
  index:
    type: string
  basename:
    type: string
  threads:
    type: int
  dt:
    type: boolean
  output:
    type: string
  bamfile:
    type: string
  file:
    type: string
  gt:
    type: File
  indx:
    type: Directory
outputs:
  fwd:
     type: File
     outputSource: sra2fastq/forward
  rev:
     type: File
     outputSource: sra2fastq/reverse
  qual:
     type: Directory
     outputSource: fastqc/report_dir
  build_out:
     type: Directory
     outputSource: build/built
  hisat:
     type: File
     outputSource: hisat2/hisat2_sam
  sorted:
     type: File
     outputSource: sort/sorted_bamfile
  assemble:
     type: File
     outputSource: stringtie/assemble_output
steps:
  sra2fastq:
     run: fastq_dump.cwl
     in: 
       sra_file:
         source: sraFiles
       split_files:
         source: split
     out: [forward, reverse]
  fastqc:
     run: fastqc.cwl
     in: 
       fastq_fwd:
         source: sra2fastq/forward
       fastq_rev:
         source: sra2fastq/reverse
     out: [report_dir]
  build:
     run: hisat2_build.cwl
     in:
       ref:
         source: reference_file
       id:
         source: index
     out: [built]
  hisat2:
     run: hisat2.cwl
     in: 
       hisat2_idx_basedir:
         source: indx
       hisat2_idx_basename:
         source: basename
       threads:
         source: threads
       dta:
         source: dt
       out_sam_name:
         source: output
       fastq_fwd: 
         source: sra2fastq/forward
       fastq_rev:
         source: sra2fastq/reverse
     out: [hisat2_sam]
  conversion:
     run: sam_to_bam.cwl 
     in:
       sam_input:
         source: hisat2/hisat2_sam
     out: [bam_output] 
  sort:
     run: samtools_sort.cwl
     in:
       out_file:
          source: bamfile
       threads: 
          source: threads
       input_bam:
          source: conversion/bam_output
     out: [sorted_bamfile]
  stringtie:
     run: stringtie.cwl
     in: 
       input_bam:
          source: sort/sorted_bamfile
       output_filename:
          source: file
       threads:
          source: threads
       gtf:
          source: gt
     out: [assemble_output]
     

  
  
  
     
  
