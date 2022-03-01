#ramo e folha

#---
#incluir bibliotecas:
library(readr) #leitura de dados
library(tibble) #estruturação de data.frame
library(magrittr) #operador pipe '%>%', concatena linhas de comando
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados
library(data.table) #manipulação de base data.frame

#importar dados:
turismo <- read_csv(file = "/home/serigo/Documentos/Dados_uff_R/turismo.csv")
View(turismo)

#transformar data.frame em tibble
turismo <- tibble(turismo)
class(turismo)
str(turismo)

#plot
stem(turismo$cheg_2014)
