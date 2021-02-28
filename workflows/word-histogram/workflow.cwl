#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  infile: File

steps:
  downcase:
    run: downcase.cwl
    in:
      infile: infile
    out: [output]
  rmindex:
    run: remove-index.cwl
    in:
      infile: downcase/output
    out: [output]
  split:
    run: split-words.cwl
    in:
      infile: rmindex/output
    out: [output]
  histogram:
    run: histogram.cwl
    in:
      infile: split/output
    out: [output]

outputs:
  output: 
    type: File
    outputSource: histogram/output
