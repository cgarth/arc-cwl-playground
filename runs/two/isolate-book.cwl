#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  InitialWorkDirRequirement:
    listing:
    - entryname: script
      entry: |
        grep "^$1" "$2" \
        | cut -d" " -f3-

baseCommand:
  - bash
  - script

stdout: book-$(inputs.book).txt

inputs:
  book:
    type: string
    inputBinding:
      position: 1
  inputfile:
    type: File
    inputBinding:
      position: 2

outputs:
  bookfile:
    type: File
    outputBinding:
      glob: book-$(inputs.book).txt

