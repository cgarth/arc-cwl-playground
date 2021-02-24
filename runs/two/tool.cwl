class: CommandLineTool
cwlVersion: v1.0

requirements:
  InlineJavascriptRequirement: {}
#   DockerRequirement:
#     dockerPull: python:3.8-alpine

inputs:
  infile: 
    type: File
    inputBinding:
        position: 2
  script:
    type: File
    inputBinding:
        position: 1
    default: 
        class: File
        location: ./plot.py

baseCommand: python3

outputs:
  plot:
    type: File
    outputBinding:
      glob: test.pdf
