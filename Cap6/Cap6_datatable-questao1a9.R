#considerando os dados de vendas

#declarando biblioteca
library(data.table)

#importando dados
dados <- read.csv2(file = "http://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")

#transformando data.frame em data.table
dt <- data.table::data.table(dados)
dt
class(dt)
View(dt)

#1 - obtenha a media e o desvio-padrão da coluna valor_compra para cada filial
dt[,c(lapply(.SD, mean),lapply(.SD,sd)),.SDcols = "valor_compra", by = filial]

#2 - ordene as linhas em ordem crescente de n_itens,
#seguido de ordem decrescente de filial
setorder(dt, n_itens, -filial)
dt[1:8,1:4]

#3 - quantos cupons tiveram valor_compra acima de 30?
dt[,sum(valor_compra>30)]

#4 - qual a venda média dos cupons da filial "A" que tiveram mais de cinco itens adquiridos
#e quantos cupons apresentaram essa condição
dt[n_itens > 5 & filial == "A", .(media = mean(valor_compra),.N)]

#5 - quais são os dois cupons da filial "A" que apresentam mais de cinco itens adquiridos?
#utilize o comando .SD que fornece um subconjunto dos dados que atendem as condições especificadas.
dt[filial == "A" & n_itens > 5, .SD] #.SD é o conjunto, retorna o data.table com as condições

#6 - obtenha o valor medio das compras de cada grupo formado pelo par de colunas filial e quinzena
#utilize a função lapply()
dt[,lapply(.SD,mean), .SDcols = "valor_compra",by=.(filial,quinzena)]

#7 - obtenha a venda media agrupada pela filial
dt[,lapply(.SD,mean), .SDcols = "valor_compra", by = filial]

#8 - obtenha a media do valor_compra agurpada pelo desconto_perc,
#atendendo a condição de que desconto deve ser maior que dez
dt[,lapply(.SD,mean), .SDcols = "valor_compra", by = desconto_perc ][desconto_perc > 10]

#9 - obtenha a media do desconto_perc agrupada pela filial,
#atendendo a condição de que filial deve ser iqual a "B"
dt[,lapply(.SD, mean), .SDcols = "desconto_perc", by = filial][filial == "B"]
