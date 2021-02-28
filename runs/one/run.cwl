#!/usr/bin/env cwl-runner

cwlVersion: v1.1
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement
  - class: StepInputExpressionRequirement

inputs:
  param: Any
  _base:
    type: string
    default: "."

steps:
  main:
    run: ../../workflows/word-histogram/workflow.cwl
    in:
      infile: { source: param, valueFrom: $(self.infile) }
    out: [output]

  collect:
    run: ../../workflows/lib/collect.cwl
    in:
      what: 
        source: [main/output]
        linkMerge: merge_flattened
      base: _base
    out: [out]

outputs:
  out:
    type: Directory
    outputSource: collect/out
