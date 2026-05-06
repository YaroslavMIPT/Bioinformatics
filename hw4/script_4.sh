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



# Улучшенный Velvet (добавлена фильтрация по покрытию)

/home/STUDY/FBMF/bioinformatics/soft/velvet/velveth ~/hw/hw4/velvet/k31_improved 31 -fastq-shortPaired $FASTQ1 $FASTQ2



/home/STUDY/FBMF/bioinformatics/soft/velvet/velvetg ~/hw/hw4/velvet/k31_improved -ins_length 300 -exp_cov auto -cov_cutoff auto



# Улучшенный SPAdes (расширенный набор k-mer)

python3 /home/STUDY/FBMF/bioinformatics/soft/SPAdes-4.2.0-Linux/bin/spades.py --careful -k 21,33,55,77,99 -1 $FASTQ1 -2 $FASTQ2 -o ~/hw/hw4/genome_assembly_results/spades_improved
