class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/hisat2:2.1.0--py36h2d50403_1
baseCommand:
  - hisat2
arguments:
  - prefix: -S
    valueFrom: $(runtime.outdir)/$(inputs.out_sam_name)
  - prefix: -x
    valueFrom: $(inputs.hisat2_idx_basedir.path)/$(inputs.hisat2_idx_basename)
inputs:
  - id: hisat2_idx_basedir
    type: Directory?
  - id: hisat2_idx_basename
    type: string
  - id: threads
    type: int?
    inputBinding:
      position: 0
      prefix: '-p'
  - id: dta
    type: boolean?
    default: true
    inputBinding:
      prefix: --downstream-transcriptome-assembly  
  - id: out_sam_name
    type: string?
    inputBinding:
    default: out.sam
  - id: fastq_fwd
    type: File?
    inputBinding:
      prefix: '-1'
  - id: fastq_rev
    type: File?
    inputBinding:
      prefix: '-2'
outputs:
  - id: hisat2_sam
    type: File?
    outputBinding:
      glob: $(inputs.out_sam_name)
label: hisat

