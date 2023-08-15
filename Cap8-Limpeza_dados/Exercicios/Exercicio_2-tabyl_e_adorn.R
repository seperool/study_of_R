#Janitor e tidyverse
##tabyl e adorn_

#Exercicio 2
#Use adorn_ para converter as colunas númericas FAT e FRETE
#para porcentagens de linha.

#Biblioteca
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(janitor) #Limpeza de dados

#data.frame
df <- data.frame(ID = c(1000,1001,1002,1003),
                FAT = c(2098.60,345.00,1332.44,845.00),
                FRETE = c(0.00,5.60,20.00,18.30))
df

#Tabulação cruzada
tabyl(df,FAT,FRETE) %>% 
  adorn_percentages("row") %>% 
  adorn_pct_formatting()
