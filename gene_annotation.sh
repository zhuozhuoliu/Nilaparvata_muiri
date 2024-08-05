# Nr
diamond blastp --db /path/to/your/Nr_database/nr --query protein.fa --out nr.xml --outfmt 5 --sensitive --max-target-seqs 20 --evalue 1e-5 --id 20 --tmpdir /dev/shm --index-chunks 1

# Nt
blastn -query your.fasta. -db /path/to/your/Nt_database/nt -out results.txt -outfmt 6 -max_target_seqs 20 -evalue 1e-5 -num_threads 100

