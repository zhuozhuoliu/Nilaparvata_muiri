#hifiasm v0.19.8-r603

hifiasm --primary -o asmp -t 200 ccs*.fasta 2> asmp.log
awk '/^S/{print ">"$2;print $3}' asmp.p_ctg.gfa > asmp.p_ctg.fa


#HaploMerger2

mkdir project_your_name
cd project_your_name
cp /path/to/your/contig.fa .

cp ../project_template/hm.batchA* .
cp ../project_template/hm.batchB* .
cp ../project_template/hm.batchD* .
cp ../project_template/all_lastz.ctl .
cp ../project_template/scoreMatrix.q .

windowmasker \
    -checkdup true \
    -mk_counts \
    -in contigs.fa \
    -out masking-library.ustat \
    -mem 6500
	
windowmasker \
  -ustat masking-library.ustat \
  -in contigs.fa \
  -out contigs_wm.fa \
  -outfmt fasta \
  -dust true
  
gzip contigs_wm.fa
  
sh ./hm.batchA1.initiation_and_all_lastz contigs_wm 
sh ./hm.batchA2.chainNet_and_netToMaf contigs_wm 
sh hm.batchA3.misjoin_processing contigs_wm
sh hm.batchB1.initiation_and_all_lastz contigs_wm_A_A_A
sh hm.batchB2.chainNet_and_netToMaf contigs_wm_A_A_A
sh hm.batchB3.haplomerger contigs_wm_A_A_A
sh hm.batchB4.refine_unpaired_sequences contigs_wm_A_A_A
sh hm.batchB5.merge_paired_and_unpaired_sequences contigs_wm_A_A_A