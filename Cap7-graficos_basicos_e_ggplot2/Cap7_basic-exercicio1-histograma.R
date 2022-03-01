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

#incluir bibliotecas
library(readr) #leitura de dados
library(tibble) #estruturação de dataframe
library(magrittr) #operador pipe '%>%', concatena linhas de comando
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados
library(data.table) #manipulação de base de dados dataframe

#importar dados
turismo <- read.csv(file = "/home/serigo/Documentos/Dados_uff_R/turismo.csv")
View(turismo)

#transformando dataframe em tibble
turismo <- tibble::tibble(turismo)
class(turismo)
str(turismo)

#plot
hist(turismo$cheg_2014/1000,
     col = "darkblue" , #colorir diversos itens do grafico
     main = "Histograma" , #titulo
     xlab = "Numero de chegadas por mil" , #rotulo do eixo x
     ylab = "Frequencia" , #rotulo do eixo y
     sub = "Fonte: elaboração propria") #legenda

#fechando dispositivo grafico
dev.off()
