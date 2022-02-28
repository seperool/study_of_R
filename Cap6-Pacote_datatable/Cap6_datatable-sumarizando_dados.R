#realizar operações de apuração de valores sobre as linhas de um data.table

#1 - .N
#conta o numero de linhas

#2 - DT[,.N,by = c(j1, ... , jn)]
#conta o numero de linhas de acordo com os agrupamentos das colunas j1,...,jn

#3 - DT[,.(f1(j, ... ,fn(j)), by = j)]
#aplica divesas funções nas colunas especificadas 
#de acordo com o agrupamento da coluna j em by

#4 - DT[,.(f1(j), ... , fn(j)), keyby = .(j1, ... , jn)]
#aplica diversas funções nas colunas especificadas
#de acordo com o agrupamento das colunas listadas j1,...,jn em keyby

#obs.: no agrupamento dos dados, segue a ordem de aparição das colunas citadas
#by=j1,...,jn , a primeira coluna a agrupar vai ser a j1 e por ultimo a jn
#---

#exemplos

#declarando de biblioteca
library(data.table)

#importando dados
dados <- read.csv2(file = "http://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")

#transformando dados de data.frame para data.table
dt <- data.table::data.table(dados)
class(dt) #verificando o tipo de dado
View(dt) #visualizando a tabela

#contando o numero de observações por filial
dt[,.N, by = filial]

#fornecendo um nome para a coluna de contagem
dt[,.(contagem = .N),by = filial]

#contando o numero de observações por filial, ordenando pela contagem
dt[,.(contagem = .N),by = filial][order(contagem)]
#ou
dt[,.N,by = filial][order(N)]

#calcular a média da coluna valor_compra de acordo com os grupos da coluna filial
dt[,.(mean(valor_compra)), by = filial]
#ou
dt[,.(venda_media_por_cupom = mean(valor_compra)), by = filial]

#calculando a media da coluna valor_compra 
#de acordo com os grupos da coluna filial e quinzena
dt[,.(venda_media_por_cupom = mean(valor_compra)),keyby = .(filial, quinzena)]

#calculando a media da coluna valor_compra 
#de acordo com os grupos da coluna filial e quinzena, 
#considerando apenas a quinzena 1
dt[quinzena == 1,.(venda_media_por_cupom = mean(valor_compra)),keyby = .(filial, quinzena)]