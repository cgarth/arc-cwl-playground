#!/usr/bin/env cwl-runner

cwlVersion: v1.2
class: Workflow

requirements:
  - class: StepInputExpressionRequirement
  - class: ScatterFeatureRequirement
  - class: MultipleInputFeatureRequirement

inputs:
  param: Any
  _base:
    type: string
    default: .

steps:
  determine-books:
    run: determine-books.cwl
    in:
      inputfile: { source: param, valueFrom: $(self.infile) }
    out: [books]

  split-books:
    run: isolate-book.cwl
    in: { inputfile: { source: param, valueFrom: $(self.infile) }, book: determine-books/books }
    scatter: book
    out: [bookfile]

  count:
    run: wordcount.cwl
    in: { inputfile: split-books/bookfile }
    out: [count]
    scatter: inputfile

  combine:
    run: combine.cwl
    in: { columns: [determine-books/books, count/count] }
    out: [combined]

  collect:
    run: ../../workflows/lib/collect.cwl
    in:
      what: [combine/combined, determine-books/books]
      base: _base
    out: [out]

outputs:
  out:
    type: Directory
    outputSource: collect/out
  
