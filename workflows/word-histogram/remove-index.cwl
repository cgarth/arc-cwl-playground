#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

baseCommand: [cut, -d, " ", -f, 3-]

stdin: $(inputs.infile.path)
stdout: output

inputs:
  infile: File

outputs:
  output: stdout

