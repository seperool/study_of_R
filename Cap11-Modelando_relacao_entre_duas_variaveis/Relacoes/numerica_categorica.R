#Relações entre duas variáveis
#Numérica (resposta) ~ categórica (explicação) (Y~X)

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(dplyr) #Manipulação dados
library(tidyr) #Organização de dados
library(ggplot2) #Elaboração de gráficos
library(patchwork) #Layout, juntar ggplot no mesmo gráfico
library(mice) #Substitui valores perdidos
library(janitor) #Limpeza de dados
library(DescTools) #Análise descritiva de forma rápida e completa
library(lubridate) #Transformar e extrair datas, funções para trabalhar com datas

#Importando dados
dados <- read.csv2(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/vendas.csv")
head(dados)
str(dados)

#Tratando os dados
dados$filial <- as.factor(dados$filial) #Transformando dados filial em tipo fator
str(dados)

#Analise rápida dos dados
Desc(valor_compra ~ filial, dados,
     digits = 1,
     plotit = TRUE, 
     test = kruskal.test)
