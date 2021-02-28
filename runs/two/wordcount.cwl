#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  InlineJavascriptRequirement: {}
  
baseCommand: [wc, -w]

stdin: $(inputs.inputfile.path)
stdout: count

inputs:
  inputfile: File

outputs:
  count:
    type: int
    outputBinding:
      glob: count
      loadContents: true
      outputEval: |
        ${
          return parseInt(self[0].contents)
        }
