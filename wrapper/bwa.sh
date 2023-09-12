#!/bin/bash

# Define working directories
BWA_DIR=~/Documents/2023/Ian/RESULTS/BWA
DIR_FASTQ=/home/lucas/DATA

# Ensure the BWA directory exists or create it
mkdir -p "$BWA_DIR"

# Activate the conda environment if needed (uncomment this line if it's required)
#conda activate bwa-env

# Download the genomic file if it doesn't exist
if [ ! -f "GCF_000001405.40_GRCh38.p14_genomic.fna.gz" ]; then
    wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.40_GRCh38.p14/GCF_000001405.40_GRCh38.p14_genomic.fna.gz
fi

# Decompress the genomic file if needed
if [ -f "GCF_000001405.40_GRCh38.p14_genomic.fna.gz" ]; then
    gunzip GCF_000001405.40_GRCh38.p14_genomic.fna.gz
fi

# Index the genome with BWA
bwa index GCF_000001405.40_GRCh38.p14_genomic.fna

# Change to the BWA directory
cd "$BWA_DIR"

# Map the FASTQ files with BWA and sort the results using samtools
bwa mem -t 8 $DIR_FASTQ/*.fastq.gz | samtools sort -o SRR966.sorted.bam
