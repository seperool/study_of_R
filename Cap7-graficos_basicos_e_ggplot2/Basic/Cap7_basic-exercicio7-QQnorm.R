#QQnorm

#---
#declaração de bibliotecas
library(readr) #leitura de dados
library(tibble) #estruturação de data.frame
library(magrittr) #operador pipe '%>%', concatena linhas de comando
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados
library(data.table) #manipulação de base de dados data.frame

#importar dados
turistas <- read.csv(file = "/home/serigo/Documentos/Dados_uff_R/turismo.csv")
#View(turistas)

#transformação de data.frame em tibble
turistas <- tibble::tibble(turistas)
class(turistas)
str(turistas)

#plot
qqnorm(turistas$cheg_2012)

#fechando dispositivo grafico
dev.off()
