#Histograma

#observa-se nesses graficos principalmente a simetria e seu desvio, presença
#de valores discrepantes. também conhecido como outliers, assim como a amplitude
#da variavel.

#no histograma, observa-se principalmente a forma como a variavel numerica se 
#distribui.

#É muito parecido e confundido com o grafico de barras, porem o grafico de
#barras se aplica a uma variavel categorica.
#É um grafico de eixo numerico unico.

#Enquanto que o histograma diz respeito somente a variveis numericas e possui
#dois eixos numericos.

#---

#declarando bibliotecas
library(readr) #leitura de dados
library(tibble) #tipo de data.frame
library(magrittr) #operador pipe '%>%', concatena linhas de comando
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados
library(data.table) #manipulação de base de dados data.frame

#importando dados
turismo <- read.csv(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
View(turismo) #visualizando data.frame

#transformando data.frame em tibble
dados <- tibble(turismo)
class(dados) #conferindo tipo da tabela
str(dados)

#compreendendo a distribuição frequencia de chegadas de turistas do Brasil em
#2012
x <- dados$cheg_2012/1000

#histograma
hist(x,
     freq = T, #se T fornece a frequencia absoluta, se F fornece a frequencia relativa
     main = "Histograma das chegadas de turistas ao Brasil em 2012",
     xlab = "Chegadas de turistas em 2012 por mil",
     ylab = "Frequencia Absoluta das chegadas",
     sub = "Fonte: elaboração propria")

#fechando dispositivo grafico
dev.off()
