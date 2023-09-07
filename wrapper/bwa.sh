#!/bin/bash

conda activate bwa-env
# Activation of bwa environnement. Which contain all the application that will be used for this step

wget "downloading link of human Refseq" > Refseq.zip
# Download human Refseq in format fasta and put it in the file "Refseq.zip"

bwa index Refseq.zip
#Index le fichier "Refseq.zip" comme référence

BWA_DIR="~/Documents/2023/Ian/RESULTS/BWA"
mkdir -p $BWA_DIR
# work directory 

cd $BWA_DIR

bwa mem -t 8 Refseq.zip $DIR_FASTQ/*.fastq.gz | samtools sort -o $BWA_DIR/bwa.sorted.bam
#"bwa mem" permit the mapping, "samtool" permit to convert the file obtained in extension ".sam" after mapping, in a file ".bam"; which use less stockage space 

multiqc
#multiqc will do a quality control in all the file in the directory $BWA_DIR. This repertory must contain only the file "bwa.sorted.bam
