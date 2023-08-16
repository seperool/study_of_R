#Janitor e tidyverse
##tabyl e adorn_

#Exercicio 6
#Adicione um adorno à tabela, totalizando as colunas de FAT1 e FAT2.

#Biblioteca
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(janitor) #Limpeza de dados

#data.frame
df <- data.frame(ID = c(1000,1001,1002,1003),
                FAT1 = c(2098.60,345.00,1332.44,845.00),
                FAT2 = c(1000,800,800,400))
df

#Tabulação cruzada
##Contabilizando o total de cada coluna, com duas variáveis
##adorn_totals()
tabyl(df,FAT1,FAT2) %>% 
  adorn_totals(.)
