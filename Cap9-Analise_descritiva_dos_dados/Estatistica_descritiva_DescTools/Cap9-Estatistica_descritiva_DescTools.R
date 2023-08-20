#Análise descritiva dos dados
#Estatística descritiva com o pacote DescTools
#DescTools - Análise descritiva de forma rápida e completa

#Bibliotecas
library(readr) #Leitura de dados
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(ggplot2) #Elaboração de gráficos
library(janitor) #Limpeza de dados
library(DescTools) #Análise descritiva de forma rápida e completa
library(grid) #Adiciona funções gráficas ao sistema ggplot2 e é um pacote gráfico também
library(patchwork) #Layout, juntar ggplot no mesmo gráfico

#Importação de dados
dt <- read_csv2(file = "~/Programacao/R/Dados/Dados_de_importacao/vendas.csv")
dt <- data.frame(dt)
dt$filial <- as.factor(dt$filial)
dt$quinzena <- as.integer(dt$quinzena)
head(dt)

#Análise descritiva com DescTools
Desc(dt, digits = 2, plotit = F)

#Visualização gráfica
#Gráfico descritivo de variável quantitativa - contínua:
#Histograma sobreposto com curva de densidade estimada
#boxplot
#Frequência acumulada para cada intervalo da variável
plot(Desc(dt$valor_compra),main = "Valor da compra")

#Fechando dispositivo gráfico
dev.off()

#-------------------------------------------------------------------------------
#Gráfico descritivo de variável quantitativa - discreta:
#Dicotômica (dois niveis) - parecido com boxplot
plot(Desc(dt$quinzena),main = "Quinzena",
     col = colorRampPalette(c("gray10","gray25","gray50","gray75","gray90"))(7))

#Fechando dispositivo gráfico
dev.off()

#-------------------------------------------------------------------------------
#Gráfico descritivo de variável qualitativa - categórica:
#Politômica (mais de dois niveis)
plot(Desc(dt$filial),main = "Filial",
     col = colorRampPalette(c("gray10","gray90"))(1))

#Fechando dispositivo gráfico
dev.off()