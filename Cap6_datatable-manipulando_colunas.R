#opções de como selecionar colunas de um data.table

#1 - DT[,j] ou DT[[j]]
#seleciona a coluna j e retorna um vetor

#2 - DT[,list(j)] ou DT[,.j]
#seleciona a coluna j e retorna um data.table

#3 - DT[,-c(j1,j2,...,jn)]
#exclui as colunas listadas: j1,j2, ..., jn

#4 - DT[,.(j1,j2,...,jn)]
#retornas as colunas listadas: j1 ate jn

#5 - DT[,.(nome_escolhido = função(j))]
#aplica a função especificada a coluna j e retorna um data.table

#6 - DT[,.(nome1 = f(j1), nome2 = f(j2), ... ,nomen = f(jn))]
#aplica varias funções a varias colunas e retorna um data.table

#7 - DT[,novacol := vetor]
#adiciona uma nova coluna

#8 - DT[,c("col1","col2", ... , "coln") := c(vetor1,vetor2, ... , vetorn)]
#adiciona varias novas colunas

#obs.: "." ajuda a retorna valor como data.table

#---

#exemplos:

#declarando biblioteca
library(data.table)

#importando dados
dados <- read.csv2(file = "http://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")

#transformando data.frame em data.table
dt <- data.table::data.table(dados)
class(dt)
