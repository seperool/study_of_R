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
class(dt) #conferindo a classe de dt
View(dt) #visualizando dt

#exibindo as 2 primeiras linhas da coluna 3
dt[1:2,3]

#exibindo as duas primeiras linhas das colunas de 1 a 3
dt[1:2,1:3]

#exibindo as duas primeiras linhas das colunas 1, 2 e 6
dt[1:2, c(1,2,6)]

#excluindo a coluna quinzena (exibindo as duas primeiras linhas)
dt[1:2, -"quinzena"]

#excluindo a coluna quinzena e desconto_perc (exibindo as duas primeiras linhas)
dt[1:2, -c("quinzena","desconto_perc")]

#criando uma nova coluna com valor repetido em todas as linhas e exibindo as linhas 1 e 2 e colunas 6 e 7
dt[,novacol := 0][1:2,6:7]

#removendo uma coluna
dt[, novacol := NULL][1:2]

#obtendo a media e o desvio-padrão de valor_compra
dt[,.(media = mean(valor_compra), desv_pad = sd(valor_compra))]

#obtendo a soma de valor_compra, n_itens e desconto_perc
dt[,.(s1 = sum(valor_compra), s2 = sum(n_itens), s3 = sum(desconto_perc))]
