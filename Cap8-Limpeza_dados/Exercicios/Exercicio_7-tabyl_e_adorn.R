#Janitor e tidyverse
##tabyl e adorn_

#Exercicio 7
#Adorne a tabela com porcentagens e contagem.

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
##Porcentagem e contagem, com três variáveis
tabyl(df,ID,FAT,FRETE) %>% 
  adorn_percentages("all") %>% 
  adorn_pct_formatting() %>% 
  adorn_ns()
