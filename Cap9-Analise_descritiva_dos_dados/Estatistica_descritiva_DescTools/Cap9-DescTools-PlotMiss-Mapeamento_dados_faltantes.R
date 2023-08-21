#Análise descritiva dos dados
#Estatística descritiva com o pacote DescTools
#DescTools - Análise descritiva de forma rápida e completa
#PlotMiss para mapeamento de dados faltantes

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

#Mapeamento dos dados faltantes
PlotMiss(dt, main = "Dados Faltantes", clust = TRUE)