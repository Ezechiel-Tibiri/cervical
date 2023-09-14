#!/bin/bash

# Define working directories
BWA_DIR=~/Documents/2023/Ian/RESULTS/BWA
DIR_FASTQ=/home/lucas/DATA

# Ensure the BWA directory exists or create it
mkdir -p "$BWA_DIR"

# Activate the conda environment if needed (uncomment this line if it's required)
#conda activate bwa-env

<<<<<<< HEAD
DIR_FASTQ="/home/ianlucas/DATA"
BWA_DIR="/home/ianlucas/Documents/2023/Ian/RESULTS/BWA"
mkdir -p $DIR_FASTQ
mkdir -p $BWA_DIR
# work directory 
=======
# Download the genomic file if it doesn't exist
if [ ! -f "GCF_000001405.40_GRCh38.p14_genomic.fna.gz" ]; then
    wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/001/405/GCF_000001405.40_GRCh38.p14/GCF_000001405.40_GRCh38.p14_genomic.fna.gz
fi
>>>>>>> 0197b5ee0723595f57977dbd4d29596ae18674a2

# Decompress the genomic file if needed
if [ -f "GCF_000001405.40_GRCh38.p14_genomic.fna.gz" ]; then
    gunzip GCF_000001405.40_GRCh38.p14_genomic.fna.gz
fi

<<<<<<< HEAD
bwa mem -t 8 Refseq.zip $DIR_FASTQ/*.fastq | samtools sort -o $BWA_DIR/bwa.sorted.bam
#"bwa mem" permit the mapping, "samtool" permit to convert the file obtained in extension ".sam" after mapping, in a file ".bam"; which use less stockage space 
=======
# Index the genome with BWA
bwa index GCF_000001405.40_GRCh38.p14_genomic.fna
>>>>>>> 0197b5ee0723595f57977dbd4d29596ae18674a2

# Change to the BWA directory
cd "$BWA_DIR"

# Map the FASTQ files with BWA and sort the results using samtools
bwa mem -t 8 $DIR_FASTQ/*.fastq.gz | samtools sort -o SRR966.sorted.bam
