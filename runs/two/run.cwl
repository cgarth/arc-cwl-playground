#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: Workflow

requirements:
  SubworkflowFeatureRequirement: {}
  InlineJavascriptRequirement: {}

inputs:
  infile:
    type: File

steps:
  main:
    run: 
      class: CommandLineTool
      baseCommand: python3
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
      outputs:
        plot:
          type: File
          outputBinding:
            glob: test.pdf
    in:
      infile: 
        source: infile
    out: [plot]

outputs:
  plot:
    type: File
    outputSource: main/plot

