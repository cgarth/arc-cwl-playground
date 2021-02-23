#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: Workflow

requirements:
  SubworkflowFeatureRequirement: {}
  InlineJavascriptRequirement: {}

inputs: []

steps:
  main:
    run: ../../workflows/word-histogram/workflow.cwl
    in:
      infile:
        default:
          class: File
          location: ../../assets/bible/mlbible.txt
    out: [outfile]

outputs:
  outfile:
    type: File
    outputSource: main/outfile

