#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  InlineJavascriptRequirement: {}
  InitialWorkDirRequirement:
    listing:
    - entryname: script
      entry: |
        awk '{ print $1 }' \
        | sort -k 1 \
        | uniq                

inputs:
  inputfile: File

outputs:
  books:
    type: string[]
    outputBinding:
      glob: books.txt
      loadContents: true
      outputEval: |
        ${
          return self[0].contents.trim().split('\n')
        }

stdout: books.txt
stdin: $(inputs.inputfile.path)

baseCommand:
  - bash
  - script
