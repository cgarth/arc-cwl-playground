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
    out: [outfile]
  # rmindex:
  #   run: remove-index.cwl
  #   in:
  #     infile: downcase/outfile
  #   out: [outfile]
  # split:
  #   run: split-words.cwl
  #   in:
  #     infile: rmindex/outfile
  #   out: [outfile]
  # histogram:
  #   run: histogram.cwl
  #   in:
  #     infile: split/outfile
  #   out: [outfile]

outputs:
  outfile:
    type: File
    outputSource: downcase/outfile
