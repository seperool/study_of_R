#Janitor e tidyverse
##tabyl e adorn_

#Exercicio 5
#Adicione um adorno à tabela, contabilizando o total de cada coluna.

#Biblioteca
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(janitor) #Limpeza de dados

#data.frame
df <- data.frame(ID = c(1000,1001,1002,1003),
                FAT = c(2098.60,345.00,1332.44,845.00),
                ANO = c(2016,2016,2017,2017))
df

#Tabulação cruzada
##Contabilizando o total de cada coluna, com três variáveis
##adorn_totals()
tabyl(df,ID,FAT,ANO) %>% 
  adorn_totals(.)
