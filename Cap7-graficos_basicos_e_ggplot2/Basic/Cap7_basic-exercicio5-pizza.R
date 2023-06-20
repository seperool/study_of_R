#grafico circular (pizza)

#Utilize-o somente em caso de a variavel possuir poucas categorias 
#(em torno de 5)
#com quantidas diferentes entre si

#caso contrario o analista deve optar pelo grafico de barras

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

#Estados com chegadas em 2014 acima de 150 mil
dt <- table(turistas$Estado[turistas$cheg_2014>150000])
dt <- dt[dt>0]
y <- dt
x <- names(dt)

porc <- 100*round(y/sum(y),2) #calcula a porcentagem %
rotulos <- paste(x,"(",porc,"%)", sep = "") #texto para os rotulos

#plot
par(mar = c(4,0,2,0), mai = c(0.8,0,0.4,0))
pie(y,
    main = "Estados com chegadas de turistas acima de 150 mil em 2014",
    labels = rotulos,
    cex.main = 2, #controla o tamanho da fonte do titulo, valor padrão é 1
    cex = 1.5, #controla o tamanho da fonte do textos, valor padrão é 1
    col = gray(1:length(x)/length(x))) #comando para colorir diversos itens do grafico

#fechando dispositivo grafico
dev.off()
