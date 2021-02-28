#!/usr/bin/cwl-runner

cwlVersion: v1.1
class: ExpressionTool

requirements:
  InlineJavascriptRequirement: {}

inputs:
  what: Any[]
  base: string

outputs:
  out: Directory

expression: |
  ${
    var files = inputs.what.filter(function(obj) {
      console.log(obj);
      return obj.class == 'File' || obj.class == 'File[]';
    })

    return {
      "out": {
        "class": "Directory", 
        "basename": inputs.base,
        "listing": files
      } 
    };
  }