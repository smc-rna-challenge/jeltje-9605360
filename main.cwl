class: Workflow
cwlVersion: v1.0
dct:creator: {'@id': 'http://orcid.org/0000-0002-7681-6415', 'foaf:mbox': jeltje@synapse.org,
  'foaf:name': jeltje}
doc: 'SMC-RNA challenge isoform quantification submission

  '
hints: []
id: main
inputs:
- {id: TUMOR_FASTQ_1, type: File}
- {id: TUMOR_FASTQ_2, type: File}
- {id: index, type: File}
name: main
outputs:
- {id: OUTPUT, outputSource: tpm/tpmfile, type: File}
requirements:
- {class: MultipleInputFeatureRequirement}
- {class: StepInputExpressionRequirement}
- {class: InlineJavascriptRequirement}
steps:
- id: cufflinks
  in:
  - {id: bam, source: star/output}
  - {id: index, source: tar/output}
  out: [isoforms]
  run: cufflinks.cwl
- id: star
  in:
  - id: fastqs
    source: [main/TUMOR_FASTQ_1, main/TUMOR_FASTQ_2]
  - {id: index, source: tar/output}
  out: [output]
  run: STAR.cwl
- id: tar
  in:
  - {id: index_name, source: index}
  out: [output]
  run: tar.cwl
- id: tpm
  in:
  - {id: fpkm, source: cufflinks/isoforms}
  - {id: outfile, valueFrom: $('isoforms.tpm')}
  out: [tpmfile]
  run: toTpm.cwl
