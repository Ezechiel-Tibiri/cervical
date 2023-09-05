#!/bin/bash

# work directories
DIR_FASTQ="/home/lucas/DATA"
QC_DIR="~/Documents/2023/Ian/RESULTS/QC"
mkdir -p $QC_DIR
# This script concern the "quality control"
cd $QC_DIR
# This command make quality control by using 12 core and simultanatly report the evolution of the script running thank's to " > sdout .log 2>&1". The path that leads to the data has been associated to the variable "DIR_FASTQ"
fastqc $DIR_FASTQ/*.fastq.gz --threads 12 > sdout.log 2>&1

echo "fastqc run successfully"

exit
