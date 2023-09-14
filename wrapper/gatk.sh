#!/bin/bash


GATK_DIR="/home/ianlucas/Documents/2023/Ian/RESULTS/GATK"
mkdir -p $DIR_FASTQ
mkdir -p $GATK_DIR
# work directory
=======


# Suppressing of duplicates reads by using the option "MarkDuplicates" of the "gatk"
gatk MarkDuplicates -I $BWA_DIR/SRR966.sorted.bam -O $GATK/deduplicated.bam -M $GATK/deduplicated_summary.txt
# deduplicated_summary.txt contain the modification make by the above command line


# Recalibration of quality score by using the option "BaseRecalibrator" of the "gatk"
gatk BaseRecalibrator -I $GATK/deduplicated.bam -R GCF_000001405.40_GRCh38.p14_genomic.fna -O $GATK/recal_data.table
# After "-I" we have the input file
# After "-R" we have reference genome under format "fasta"
# After "-O" we have the output file


# Applying of the recalibration by using the option "ApplyBQSR" of the "gatk"
gatk ApplyBQSR -I $GATK/deduplicated.bam -R GCF_000001405.40_GRCh38.p14_genomic.fna -bqsr recal_data.table -O $GATK/recalibrated.bam
# "-bqsr" is the recalibration file that is used for applying 



# Variant calling by using the option "Mutect2" of the "gatk"
# "Mutect2" is used in case of cancer. If it was not a case of cancer we should have used "HaplotypeCaller"
gatk Mutect2 -R GCF_000001405.40_GRCh38.p14_genomic.fna g -I $GATK/recalibrated.bam -O $GATK/variants.vcf


# filtering all variants which values are > superior or equal to "30". Which is the standard value used for filtering.
bcftools filter -i "QUAL>=30" $GATK/variants.vcf -0z -o $GATK/variants.filtered.

