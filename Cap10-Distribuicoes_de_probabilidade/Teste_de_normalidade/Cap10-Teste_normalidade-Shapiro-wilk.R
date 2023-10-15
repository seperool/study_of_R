#Teste de normalidade
#Teste de Shapiro-Wilk

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe "%>%", concatena linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados

#Leitura de dados
dados <- read.csv2(file = "~/Programacao/R/Dados/Dados_de_importacao/vendas.csv")
head(dados)
str(dados)
summary(dados)

#Tratamento dos dados
dados$filial <- as.factor(dados$filial)
str(dados)
head(dados)

x <- dados$valor_compra

#Teste de Shapiro-Wilk
shapiro.test(x)
