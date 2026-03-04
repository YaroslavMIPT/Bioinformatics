# Создание векторов
genes <- c("BRCA1", "TP53", "EGFR")
expression <- c(12.5, 45.2, 30.1)
condition <- c("Control", "Treatment", "Treatment")

# Создание таблицы (data frame)
exp_data <- data.frame(genes, expression, condition)

# Вывод структуры таблицы
str(exp_data)

# Построение столбчатой диаграммы и сохранение в PNG
png("expression_plot.png")
barplot(exp_data$expression,
        names.arg = exp_data$genes,
        xlab = "Genes",
        ylab = "Expression",
        main = "Gene Expression")
dev.off()
