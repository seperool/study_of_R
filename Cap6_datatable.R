#Estrutura do data.table DT
#DT[i, j, by]
#i = linha
#j = coluna
#by = agrupamento dos dados

#lendo os dados iniciais
dados <- read.csv2(file = "http://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")

#visualizando os dados
View(dados)

#inicializando biblioteca data.table
library(data.table)

#transformando dados em data.table
dt <- data.table::data.table(dados)

#agrupando dados dt por filial e realizando a contagem em cada grupo
dt[, .N, filial] # "." realiza a contagem e N é o nome da coluna com essa informação
