cwlVersion: v1.0
class: CommandLineTool
baseCommand: [fastq-dump]
inputs:
   sra_file:
     type: File?
     inputBinding:
       position: 0
   split_files:
     type: boolean?
     default: true
     inputBinding:
       prefix: --split-files
outputs:
   fastqFiles:
     type: File[]
     outputBinding:
      glob: "*fastq*"
  
