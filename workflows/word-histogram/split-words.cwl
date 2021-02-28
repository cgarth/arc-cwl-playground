#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

requirements:
  InitialWorkDirRequirement:
    listing:
      - class: File
        basename: script
        location: split-words.sh 

baseCommand: [ bash, script ]
      
stdin: $(inputs.infile.path)
stdout: output

inputs:
  infile: File

outputs:
  output: stdout
