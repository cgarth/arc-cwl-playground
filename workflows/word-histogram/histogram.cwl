#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: script
        entry: |-
          sort | uniq -c | sort -r -n -k 1 | head -n 20

baseCommand: [ bash, script ]
      
stdin: $(inputs.infile.path)
stdout: output

inputs:
  infile: File

outputs:
  output: stdout