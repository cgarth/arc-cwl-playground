cwlVersion: v1.2
class: Workflow

requirements:
  - class: SubworkflowFeatureRequirement
  - class: MultipleInputFeatureRequirement


inputs:
  param: Any

steps:
  one:
    run: runs/one/run.cwl
    in: { param: param, _base: { default: "runs/one" } }
    out: [out]
  two:
    run: runs/two/run.cwl
    in: { param: param, _base: { default: "runs/two" } }
    out: [out]

outputs:
  all: 
    type: Directory[]
    outputSource: 
      - one/out
      - two/out
