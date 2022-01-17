#5 possibilidades de como selecionar linhas de um DT

#1 - DT [condições sobre as colunas]
#seleciona as linhas de DT que satisfazem as condições

#2 - DT [1:k]
#seleciona as linhas de 1 a k

#3 - DT [order(j1,j2)]
#ordena os dados em ordem crescente do vetor 1, seguido por vetor 2.
#para ordem decrescente use o sinal de menos antes do nome do vetor.
#Ex.: DT[order(-j)]
#j é para simbolizar o nome do vetor, não é real.

#4 - unique(DT) ou unique(DT, by = colunas selecionadas)
#seleciona as linhas distinhas (elimina as repetidas)
#considerando as colunas selecionadas

#5 - na.omit(DT, cols = colunas selecionadas)
#elimina as linhas com valores faltantes, considerando as colunas selecionadas
#elimina NA

#---
#Obs.:
#podemos concatenas comandos como o operador pipe faz usando
#DT [...][...][...]

#---
#exemplos de como usar manipulação de linhas:

#importando dados
dados <- read.csv2(file = "http://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")

#declarando biblioteca
library(data.table)

#transformando o data.frame em data.table
dt <- data.table::data.table(dados)

class(dt) #verificando a classe de dt

#exemplos

#exibindo as linhas da filial A
dt[filial == "A"]

#exibindo as linhas de 5 a 8
dt[5:8]

#exibindo as linhas 1, 7, 10
dt[c(1,7,10)]

#exibindo as 3 primeiras linhas em ordem crescente do valor_compra
dt[order(valor_compra)][1:3]

#exibindo as 3 primeiras linhas em ordem decrescente do valor_compra
dt[order(-valor_compra)][1:3]

#exibindo as 4 primeiras linhas em ordem decrescente da filial e quinzena
dt[order(-filial,-quinzena)][1:4]

#exibindo as linhas distintas considerando as colunas filial e quinzena
unique(dt,by = c("filial","quinzena"))
