cwlVersion: v1.0
class: CommandLineTool
hints:
   DockerRequirements:
      dockerPull: 8773b3baa973
baseCommand: prefetch
inputs:
  run_ids:
    type: string[]
    inputBinding:
      position: 1
outputs:
  sraFiles:
    type: File[]
    outputBinding:
      glob: "*sra"
