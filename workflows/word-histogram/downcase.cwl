#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

baseCommand: "tr" 
arguments: ["[:upper:]", "[:lower:]"]

stdin: $(inputs.infile.path)
stdout: output
inputs:
  infile:
    type: File
    streamable: true
outputs:
  outfile:
    type: stdout
