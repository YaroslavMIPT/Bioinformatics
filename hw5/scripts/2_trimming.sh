#!/bin/bash
#SBATCH --job-name=trimming
#SBATCH --partition=AMD9554-common
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

# Точный путь к программе fastp
FASTP="$HOME/hw/hw5/soft/fastp"

DATA_DIR="$HOME/hw/hw5/data"
OUT_DIR="$HOME/hw/hw5/results/trimmed"

# Цикл ищет ЛЮБЫЕ файлы .fastq.gz
for R1 in $DATA_DIR/*.fastq.gz; do
    [ -e "$R1" ] || continue
    
    # Извлекаем базовое имя (без расширения)
    BASENAME=$(basename "$R1" .fastq.gz)
    
    echo "Обработка образца: $BASENAME"
    
    # Запуск fastp для одноконцевых (SE) чтений
    $FASTP -i "$R1" \
          -o "${OUT_DIR}/${BASENAME}_trimmed.fastq.gz" \
          --cut_right --cut_right_window_size 5 --cut_right_mean_quality 20 \
          --length_required 36 \
          --thread 4 \
          -h "${OUT_DIR}/${BASENAME}_fastp.html"
done
