#!/bin/bash

# work directories
DIR_FASTQ="~/Ezechiel/Project/cervical/cervical/data"
QC_DIR="~/Documents/2023/Ian/RESULTS/QC"
mkdir -p $QC_DIR
# This script concern the third step "quality control"
cd $QC_DIR
fastqc $DIR_FASTQ/*.fastq --threads 8

echo "fastqc run suc....."

exit
