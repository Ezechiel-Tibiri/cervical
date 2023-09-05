#!/bin/bash

# work directories
DIR_FASTQ="/home/lucas/DATA"
QC_DIR="~/Documents/2023/Ian/RESULTS/QC"
mkdir -p $QC_DIR
# This script concern the "quality control"
cd $QC_DIR
fastqc $DIR_FASTQ/*.fastq.gz --threads 8

echo "fastqc run successfully"

exit
