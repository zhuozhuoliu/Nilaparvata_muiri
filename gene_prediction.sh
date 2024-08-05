
##Trinity 
Trinity --seqType fq --left _1.clean.fq.gz --right _2.clean.fq.gz --CPU 120 --max_memory 300G 
Trinity --seqType fq --left all_left.fq.gz --right all_left.fq.gz --CPU 120 --max_memory 300G

##geta
/PATH/to/your/geta-2.6.1/bin/geta.pl \
    --genome genome.fasta \
    --pe1 all_left.clean.fastq \
    --pe2 all_right.clean.fastq \
    --protein homolog.fasta \
    --augustus_species BPH_GETA \
    --RM_lib consensi.fa \
    --cpu 120 \
    --pfam_db /opt/biosoft/hmmer-3.3.2/Pfam-A.hmm \
    --gene_prefix Hv \
    --out_prefix out


bestGeneModels.pl out.GeneModels.gff3 > bestGeneModels.gff3 2> geneModelsStatistic
gff3ToGtf.pl genome.fasta bestGeneModels.gff3 > bestGeneModels.gtf

#busco
busco -i protein.fasta -l insecta_odb10 -o busco_protein -m prot -c 120 --offline 


