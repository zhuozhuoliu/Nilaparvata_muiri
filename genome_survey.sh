#jellyfish
jellyfish count -m 19 -s 10G -t 12 -C -o sample.jf <(zcat sample_1.fq.gz) <(zcat sample_2.fq.gz)

jellyfish histo -t 12 sample.jf > sample.histo

#Genomescope2
#R 
kmer <- read.table('sample.histo')
kmer <- subset(kmer, V1 >=5 & V1 <=500) 
Frequency <- kmer$V1
Number <- kmer$V2
png('kmer_plot.png')
plot(Frequency, Number, type = 'l', col = 'blue')
dev.off()