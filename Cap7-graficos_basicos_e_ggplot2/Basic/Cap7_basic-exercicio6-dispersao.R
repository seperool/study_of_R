#dispersão

#Utilizado para observar a relação entre duas variaveis quantitativas.
#O pesquisador ao plotar esse grafico busca inicialmente uma relação linear.
#A visão do grafico deve ser acompanhada pela medida do "coeficiente de 
#correlação linear", que mede matematicamente a intensidade dessa relação.

#O coeficiente de correlação é uma medida que varia de 1 a -1, espera-se
#valores proximos de 1 ou de -1 no caso de presença de relacionamento linear.

#Esse relacionamento pode ser: 
#crescente (coeficiente positivo) ou
#decrescente (coeficiente negativo)

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
plot(turistas$cheg_2012, turistas$cheg_2013)

#fechando dispositivo grafico
dev.off()
