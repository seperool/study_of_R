#modifique valores, nome de coluna, ordem das linhas ou colunas
#com o comando set, setnames, setorder, setcolorder.

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

#modifique o valor da linha 1 e coluna 3
set(dt, i=1, j=3, value=999)
dt[1,3]

#modifique o nome da coluna 3
setnames(dt, old = "valor_compra", new = "vendas")
dt[1,1:3]

#reordenando linhas de forma decrescente
setorder(dt, -vendas, n_itens)
dt[1:3,1:4]

#reordenando linhas de forma crescente
setorder(dt, cupom)
dt[1:3,1:4]

#reordenando colunas
setcolorder(dt, c(1,3,2))
dt[1:3,1:4]
