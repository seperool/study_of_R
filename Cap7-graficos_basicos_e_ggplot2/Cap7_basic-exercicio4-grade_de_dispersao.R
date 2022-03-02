#grade de dispersão

#A função pairs permite representar gráficos de dispersão múltiplos entre todos
#os campos de um data frame, permitindo visualizar as relações entre as variáveis 
#(e.g.quais são mais correlacionadas).

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
View(turistas)

#transformação de data.frame em tibble
turistas <- tibble::tibble(turistas)
class(turistas)
str(turistas)

#filtrando colunas não numericas
turistas <- turistas %>%
  select(cheg_2012,cheg_2013,cheg_2014,cheg_2015)

#plot
pairs(turistas)

#fechando dispositivo grafico
dev.off()
