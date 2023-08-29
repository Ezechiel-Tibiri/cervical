#!/bin/bash

cd cervical/data/
# Read SRA identifiers from a text file
sra_ids=$(cat cervical/data/SRR_Acc_List.txt)
#prefetch $sra

#pf=$(prefetch $sra)
#fasterq-dump $pf --split-3
# Define the number of processes to run in parallel
num_parallel=16

# Function to download and convert an SRA sequence into FASTQ
download_sra() {
    sra_id=$1
    retries=5

    while [ $retries -gt 0 ]; do
        echo "Attempting to download $sra_id..."

        # Use prefetch to first download the SRA file (optional)
        prefetch $sra_id
        if [ $? -eq 0 ]; then
            echo "Successfully downloaded $sra_id. Converting now..."

            # Use fastq-dump to convert the SRA file into FASTQ
            fastq-dump --split-3 --gzip $sra_id
            if [ $? -eq 0 ]; then
                echo "Successfully converted $sra_id."
                break
            else
                echo "Error while converting $sra_id. Retrying..."
                retries=$((retries-1))
            fi
        else
            echo "Error while downloading $sra_id. Retrying..."
            retries=$((retries-1))
        fi

        # Wait for 10 seconds before retrying
        sleep 10
    done

    if [ $retries -eq 0 ]; then
        echo "Failed to download and convert $sra_id after multiple attempts."
    fi
}

# Export the function so it can be used by GNU parallel
export -f download_sra

# Use GNU parallel to execute the downloads in parallel
echo "$sra_ids" | parallel -j $num_parallel download_sra
