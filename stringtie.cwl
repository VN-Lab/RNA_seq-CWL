cwlVersion: v1.0
class: CommandLineTool
hints:
  DockerRequirement:
    dockerPull: quay.io/biocontainers/stringtie:1.3.0--hd28b015_2
baseCommand: [stringtie]
arguments:
  - prefix: -o
    valueFrom: $(runtime.outdir)/$(inputs.output_filename)
inputs:
  input_bam:
    type: File
    inputBinding:
      position: 0
  output_filename:
    type: string
    default: "stringtie_out.gtf"
  threads:
    type: int
    default: 1
    inputBinding:
      prefix: -p
  gtf:
    type: File
    inputBinding:
      prefix: -G
outputs:
  assemble_output:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)

