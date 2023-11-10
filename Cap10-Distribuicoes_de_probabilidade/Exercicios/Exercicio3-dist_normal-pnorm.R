#Distribuição de Probabilidade
#Distribuição Normal
#Probabilidade dentro de um intervalo

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

#Distribuição normal - probabilidade do intervalo [40,55]
#P(40<X<55), X~N(50,1)
#pnorm(final) - pnorm(inicial)
pnorm(55,50,1) - pnorm(40,50,1)
