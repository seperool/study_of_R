#definição

#o pacote possui um simbolo especial denotado por .SD
#para realaizar operações em um subconjunto de dados de DT
#de acordo com um grupo definido por by.

#portanto DT[,.SD] é um conjunto de dados completo
#já DT[, .SD, by = j] é o subconjunto completo de dados, exceto pela coluna j
#formando subconjuntos para cada grupo da coluna j

#é possivel ainda definir as colunas do conjunto completo
#que deverão se consideradas em .SD atraves do operador .SDcols

#---
#exemplo explicado:
#para obter o valor medio das compras 
#em cada grupo formado pelo par de colunas filial e quinzena
#utilize lapply(.SD,mean) aplicada na coluna valor_compra fazendo 
#.SDcols = "valor_compra"
#considerando-se o subconjunto de dados definidos em by = .(filial, quinzena)

#olhar exemplos para entender melhor como funciona

#---

#declarando biblioteca
library(data.table)

#importando dados
dados <- read.csv2(file = "http://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")

#transformando data.frame em data.table
dt <- data.table::data.table(dados)
class(dt)
View(dt)

#exemplos

#visualizar os subconjuntos da tabela por quinzena
dt[,print(.SD), by = quinzena]

#aplicando a media a coluna valor_compra por quinzena
dt[,lapply(.SD,mean), .SDcols = "valor_compra", by = quinzena]

#aplicando a media a coluna valor_compra por filial e quinzena
dt[,lapply(.SD,mean), .SDcols = "valor_compra", by = .(filial, quinzena)]

#aplicando a media as colunas valor_compra e n_itens por quinzena
dt[,lapply(.SD,mean), .SDcols = c("valor_compra","n_itens"), by = quinzena]

#aplicando a media as colunas valor_compra e n_itens por filial e quinzena
dt[,lapply(.SD,mean), .SDcols = c("valor_compra","n_itens"), by = .(filial, quinzena)]

#aplicando duas funções soma e media
dt[,c(lapply(.SD, sum),lapply(.SD,mean)), 
   .SDcols = c("valor_compra", "n_itens"), 
   by = .(filial, quinzena)]

#obs.: lembra a biblioteca magrittr, concatenando funções com o operador pipe "%>%"
#aplica funções sobre os dados como a biblioteca dplyr, summarise,
#associado a biblioteca dplyr agrupando os resultados com group_by