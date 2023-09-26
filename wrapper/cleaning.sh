#!/bin/bash


# Specify the paths to input and output directories
input_dir=/home/lucas/DATA
output_dir=~/Documents/2023/Ian/RESULTS/CLEANING
mkdir -p $output_dir
# Specify the Phred quality threshold
phred_threshold=28

# List of sequence names
sequences=(SRR9661144 SRR9661145 SRR9661146 SRR9661147 SRR9661148
           SRR9661149 SRR9661150 SRR9661151 SRR9661152 SRR9661153
           SRR9661154 SRR9661155 SRR9661157 SRR9661158 SRR9661159
           SRR9661160 SRR9661161 SRR9661162 SRR9661163 SRR9661164
           SRR9661165 SRR9661166 SRR9661167 SRR9661168 SRR9661169
           SRR9661170 SRR9661171 SRR9661172 SRR9661173)

# Loop through the list of sequences
for seq_name in ${sequences[@]}; do
    # Construct input and output file names for this sequence
    input_r1=$input_dir/${seq_name}_1.fastq.gz
    input_r2=$input_dir/${seq_name}_2.fastq.gz
    output_r1=$output_dir/${seq_name}_R1_filtered.fastq.gz
    output_r2=$output_dir/${seq_name}_R2_filtered.fastq.gz

    # Execute fastp to perform filtering, quality control, and adapter trimming
    fastp -l 100  -w 16 -i $input_r1 -I $input_r2 -o $output_r1 -O $output_r2 --detect_adapter_for_pe --qualified_quality_phred $phred_threshold  -h $output_dir/fastp.html -j $output_dir/fastp.json


done


