#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: Workflow

requirements:
  SubworkflowFeatureRequirement: {}

inputs: []

steps:
  run-one:
    run: runs/one/run.cwl
    in: []
    out: [outfile]
  run-two:
    run: runs/two/run.cwl
    in:
      infile: run-one/outfile
    out: [plot]

outputs:
  run-one-results:
    type: File
    outputSource: run-one/outfile
  run-two-results:
    type: File
    outputSource: run-two/plot
