#!/bin/bash

#SBATCH --job-name=velvet_run

#SBATCH --partition=AMD9554-common     # Доступная очередь

#SBATCH --time=01:00:00                # Лимит времени (1 час)

#SBATCH --cpus-per-task=1              # Количество ядер процессора

#SBATCH --mem=4G                       # Лимит оперативной памяти

#SBATCH --output=velvet_log.out        # Файл для вывода консоли

#SBATCH --error=velvet_err.err         # Файл для вывода ошибок



FASTQ1="/home/STUDY/FBMF/studfbmf02_13/hw/hw4/genome_de_novo/7_S4_L001_R1_001.fastq"

FASTQ2="/home/STUDY/FBMF/studfbmf02_13/hw/hw4/genome_de_novo/7_S4_L001_R2_001.fastq"

OUT_DIR="/home/STUDY/FBMF/studfbmf02_13/hw/hw4/velvet"



# k-mer 11 (Новый)

/home/STUDY/FBMF/bioinformatics/soft/velvet/velveth $OUT_DIR/k11 11 -fastq -shortPaired $FASTQ1 $FASTQ2

/home/STUDY/FBMF/bioinformatics/soft/velvet/velvetg $OUT_DIR/k11 -ins_length 300



# k-mer 21

/home/STUDY/FBMF/bioinformatics/soft/velvet/velveth $OUT_DIR/k21 21 -fastq -shortPaired $FASTQ1 $FASTQ2

/home/STUDY/FBMF/bioinformatics/soft/velvet/velvetg $OUT_DIR/k21 -ins_length 300



# k-mer 31

/home/STUDY/FBMF/bioinformatics/soft/velvet/velveth $OUT_DIR/k31 31 -fastq -shortPaired $FASTQ1 $FASTQ2

/home/STUDY/FBMF/bioinformatics/soft/velvet/velvetg $OUT_DIR/k31 -ins_length
