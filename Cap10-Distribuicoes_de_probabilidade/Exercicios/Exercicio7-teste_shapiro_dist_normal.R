#Distribuição de Probabilidade
#Distribuição Normal
#Teste de Shapiro-Wilk

#Verifica se uma variável aleatória é uma distribuição normal ou não.
#Se p-valor > 0.05, H0, ou seja, a distribuição de probabilidade da variável x é normal.
#Se p-valor <= 0.05, H1, ou seja, a distribuição de probabilidade da variável x não é normal.

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

#50 números aletórios de uma distribuição qui-quadrada com parâmetro g = 2.
set.seed(30)
x <- rchisq(50,2)
x

#Teste Shapiro-Wilk, para saber se é uma distribuição de probabilidade normal.
shapiro.test(x)
#p-value = 5.048e-06
#Logo, p-valor <= 0.05, ou seja, a distribuição de probabilidade da variável x não é normal.
