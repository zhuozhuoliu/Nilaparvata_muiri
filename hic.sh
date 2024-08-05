##yahs
conda activate hic-scaffolding

# 
samtools faidx contigs.fa
chromap -i -r contigs.fa -o contigs.index

# alignment
chromap \
    --preset hic \
    -r contigs.fa \
    -x contigs.index \
    --remove-pcr-duplicates \
    -1 *1.f*q* \
    -2 *2.f*q* \
    --SAM \
    -o aligned.sam \
    -t 150

# 
samtools view -bh aligned.sam | samtools sort -@ 100 -n > aligned.bam
rm aligned.sam    

yahs contigs.fa aligned.bam

#do not do contig error correction
#yahs contigs.fa aligned.bam --no-contig-ec

juicer pre -a -o out_JBAT \
    yahs.out.bin \
    yahs.out_scaffolds_final.agp \
    contigs.fa.fai
   
asm_size=$(awk '{s+=$2} END{print s}' contigs.fa.fai)
java -Xmx36G -jar /home/yxye/software/juicer_tools_1.19.02.jar \
    pre out_JBAT.txt out_JBAT.hic <(echo "assembly ${asm_size}")
statistic yahs.out_scaffolds_final.fa

mkdir view
cd view
juicer post -o out_JBAT out_JBAT.review.assembly ../out_JBAT.liftover.agp ../contigs.fa















