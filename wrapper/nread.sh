#!/bin/bash
# This script concern the second step "reading of 100 reads"
fastq-dump $sra | head -400


# This script concern the third step "quality control"
i=9661144
while [ $i -le 9661173 ]; do
SRR$i
fastqc --outdir /home/ianlucas/ --extract SRR$i*.fastq
  ((i=i+1))

done
# --outdir, give the path for the output
# --extract, permit to automaticaly extract the output files

