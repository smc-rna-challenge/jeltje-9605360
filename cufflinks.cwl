arguments:
- {position: 2, valueFrom: $(inputs.bam)}
baseCommand: [cufflinks]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- {id: bam, type: File}
- id: index
  inputBinding: {prefix: --GTF, valueFrom: $(self.path)/ref_annot.gtf}
  type: Directory
- default: 5000000
  id: max-bundle-fags
  inputBinding: {prefix: --max-bundle-frags}
  type: int
- default: 8
  id: num-threads
  inputBinding: {prefix: --num-threads}
  type: int
outputs:
- id: isoforms
  outputBinding: {glob: isoforms.fpkm_tracking}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: jeltje/cufflinks}
