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

#2 - ordene as linhas em ordem crescente de n_itens,
#seguido de ordem decrescente de filial

#3 - quantos cupons tiveram valor_compra acima de 30?

#4 - qual a venda média dos cupons da filial "A" que tiveram mais de cinco itens adquiridos
#e quantos cupons apresentaram essa condição

#5 - quais são os dois cupons da filial "A" que apresentam mais de cinco itens adquiridos?
#utilize o comando .SD que fornece um subconjunto dos dados que atendem as condições especificadas.

#6 - obtenha o valor medio das compras de cada grupo formado pelo par de colunas filial e quinzena
#utilize a função lapply()

#7 - obtenha a venda media agrupada pela filial

#8 - obtenha a media do valor_compra agurpada pelo desconto_perc,
#atendendo a condição de que desconto deve ser maior que dez

#9 - obtenha a media do desconto_perc agrupada pela filial,
#atendendo a condição de que filial deve ser iqual a "B"