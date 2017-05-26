baseCommand: [STAR]
class: CommandLineTool
cwlVersion: v1.0
hints: []
inputs:
- default: 1000000
  id: alignIntronMax
  inputBinding: {prefix: --alignIntronMax}
  type: int
- default: 20
  id: alignIntronMin
  inputBinding: {prefix: --alignIntronMin}
  type: int
- default: 1000000
  id: alignMatesGapMax
  inputBinding: {prefix: --alignMatesGapMax}
  type: int
- default: 1
  id: alignSJDBoverhangMin
  inputBinding: {prefix: --alignSJDBoverhangMin}
  type: int
- default: 8
  id: alignSJoverhangMin
  inputBinding: {prefix: --alignSJoverhangMin}
  type: int
- id: fastqs
  inputBinding: {prefix: --readFilesIn, separate: true}
  type: {items: File, type: array}
- id: index
  inputBinding: {prefix: --genomeDir, valueFrom: $(self.path)}
  type: Directory
- default: 999
  id: outFilterMismatchNmax
  inputBinding: {prefix: --outFilterMismatchNmax}
  type: int
- default: 0.04
  id: outFilterMismatchNoverLmax
  inputBinding: {prefix: --outFilterMismatchNoverLmax}
  type: float
- default: 20
  id: outFilterMultimapNmax
  inputBinding: {prefix: --outFilterMultimapNmax}
  type: int
- default: BySJout
  id: outFilterType
  inputBinding: {prefix: --outFilterType}
  type: string
- default: intronMotif
  id: outSAMstrandField
  inputBinding: {prefix: --outSAMstrandField}
  type: string
- default: [BAM, SortedByCoordinate]
  id: outSAMtype
  inputBinding: {prefix: --outSAMtype, separate: true}
  type: {items: string, type: array}
- default: zcat
  id: readFilesCommand
  inputBinding: {prefix: --readFilesCommand}
  type: string
- default: 8
  id: runThreadN
  inputBinding: {prefix: --runThreadN}
  type: int
outputs:
- id: output
  outputBinding: {glob: Aligned.sortedByCoord.out.bam}
  type: File
requirements:
- {class: InlineJavascriptRequirement}
- {class: DockerRequirement, dockerPull: dreamchallenge/star}
- {class: ResourceRequirement, coresMin: 8, ramMin: 80000}
