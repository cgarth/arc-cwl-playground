#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.script)

baseCommand: bash
arguments: 
  - $(inputs.script)
      
stdin: $(inputs.infile.path)
stdout: output

inputs:
  script:
    type: File
    default:
      class: File
      location: split-words.sh 
  infile:
    type: File
    streamable: true
outputs:
  outfile:
    type: stdout
    streamable: true
