cwlVersion: v1.0
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/samtools:1.9--h46bd0b3_0

baseCommand: ["samtools", "sort"]

arguments:
  - prefix: -o
    valueFrom: $(runtime.outdir)/$(inputs.out_file)

inputs:
  out_file:
    type: string
    default: sorted.bam
  threads:
    type: int
    default: 1
    inputBinding:
      prefix: -@
  input_bam:
    type: File
    inputBinding:
      position: 50

outputs:
  sorted_bamfile:
    type: File
    outputBinding:
      glob: $(inputs.out_file)
