#Análise descritiva de dados
#Execicio 9

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(dplyr) #Manipulação dados
library(tidyr) #Organização de dados
library(ggplot2) #Elaboração de gráficos
library(mice) #Substitui valores perdidos
library(janitor) #Limpeza de dados
library(DescTools) #Análise descritiva de forma rápida e completa
library(lubridate) #Transformar e extrair datas, funções para trabalhar com datas

#data.frame
x = c(paste0(rep(201905,30),c(10:30, paste0(rep(0,9),1:9))))
set.seed(30)
nascimento = ymd(sample(x,10000,replace = T))
nascimento

#[9] Os dados representam as datas de nascimento de dez mil bebês no mês de maio
#em um hospital maternidade. Faça uma análise descritiva das datas e nascimento.
str(nascimento)
Desc(nascimento)

#Fechando dispositivo gráfico
dev.off()
