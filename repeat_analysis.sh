
#repeatMasker

/path/to/your/RepeatMasker -pa 120 -e ncbi -species Insecta -dir repeatMasker/ -gff Nm_genome.fasta

# repeatModeler 
/path/to/your/RepeatModeler-2.0.3/BuildDatabase -name Ls -engine ncbi genome.fasta

/path/to/your/RepeatModeler -engine ncbi -pa 120 -database Nm

/path/to/your/RepeatMasker -pa 120 -e ncbi -lib Nmc-families.fa -dir ./ -gff genome.fasta



