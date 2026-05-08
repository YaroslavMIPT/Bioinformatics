#!/bin/bash
#SBATCH --job-name=qc_after
#SBATCH --partition=AMD9554-common
#SBATCH --time=01:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

# Точные пути к программам
FASTQC="/home/STUDY/FBMF/bioinformatics/anaconda3/bin/fastqc"
MULTIQC="$HOME/.local/bin/multiqc"

TRIM_DIR="$HOME/hw/hw5/results/trimmed"
OUT_DIR="$HOME/hw/hw5/results/qc_after"

echo "Запуск FastQC для очищенных данных..."
$FASTQC -t 4 -o $OUT_DIR $TRIM_DIR/*_trimmed.fastq.gz

echo "Запуск MultiQC..."
$MULTIQC $OUT_DIR -o $OUT_DIR
