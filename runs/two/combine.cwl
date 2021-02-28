#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: CommandLineTool

requirements:
  - class: InlineJavascriptRequirement

baseCommand: echo

arguments:
  - shellQuote: false
  - valueFrom: |
      ${
        return inputs.columns[0].map(function(f,i) {
          return inputs.columns.map(function(c) {
              return c[i]
          }).join('\t')
        }).join('\n')
      }

stdout: combined

inputs:
  columns:
    type:
      type: array
      items: 
        type: array
        items: Any

outputs:
  combined:
    type: stdout
