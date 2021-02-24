#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: Workflow

requirements:
  SubworkflowFeatureRequirement: {}
  ScatterFeatureRequirement: {}

inputs:
  infile: File

steps:
  group:
    run: group.cwl
    in: 
      infile: infile
    out: [outfiles]
  line-count:
    run:
      class: CommandLineTool
      baseCommand: [ wc, -l ]
      stdout: output
      inputs:
        infiles:
          type: File[]
          inputBinding:
            position: 1
      outputs:
        outfile:
          type: stdout
    in:
      infiles: group/outfiles
    out:
      [outfile]

outputs:
  output:
    type: File
    outputSource: line-count/outfile