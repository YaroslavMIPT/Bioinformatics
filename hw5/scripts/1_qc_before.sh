#!/bin/bash
#SBATCH --job-name=qc_before
#SBATCH --partition=AMD9554-common
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

DATA_DIR="$HOME/hw/hw5/data"
OUT_DIR="$HOME/hw/hw5/results/qc_before"

echo "Запуск FastQC..."
fastqc -t 4 -o $OUT_DIR $DATA_DIR/*.fastq.gz

echo "Запуск MultiQC..."
multiqc $OUT_DIR -o $OUT_DIR
