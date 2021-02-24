#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

requirements:
  InitialWorkDirRequirement:
    listing:
      - entryname: group.sh
        entry: |-
          groups=\$(cut -d" " -f1 $1 | sort | uniq)
          for g in $groups; do
            grep -e "^$g" $1 > book-$g.txt
          done

baseCommand: [ sh, group.sh ] 
stdout: output

inputs:
  infile:
    type: File
    inputBinding:
      position: 1

outputs:
  outfiles:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*.txt"
