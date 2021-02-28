#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

baseCommand: [ tr, "[:upper:]", "[:lower:]" ]

stdin:  $(inputs.infile.path)
stdout: output

inputs:
  infile: File

outputs:
  output: stdout

