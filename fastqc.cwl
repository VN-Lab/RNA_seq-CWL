class: CommandLineTool
cwlVersion: v1.0

id: fastqc
baseCommand: [fastqc, --outdir, .]
inputs:
  - id: fastq_fwd
    type: File?
    inputBinding:
      position: 0
  - id: fastq_rev
    type: File?
    inputBinding:
      position: 1
outputs:
  - id: report_dir
    type: Directory
    outputBinding:
     glob: .
label: fastqc
