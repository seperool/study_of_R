#declarando biblioteca
library(data.table)

#10 - crie um data.table
dt <- data.table(
  V1 = 1:10,
  V2 = c(rep(5,6),rep(c(NA,1),2)),
  V3 = rep(c("S","N"),5),
  V4 = c(1.1, 1.2, 1.1, 1.4, 1.5, 1.2, 1.3, 11.2, 1.4, 1.2),
  V5 = rep(c(1, 8, NA), rep(c(2, 7, 1)))
)
dt
class(dt) #verificando a classe do dt
View(dt) #visualizando dt

#11 - modifique o nome da coluna um para "cod".
setnames(dt, old = "V1", new = "cod")

#12 - obtenha a media da coluna V4 de acordo com os grupos da coluna V3
dt[,lapply(.SD, mean), .SDcols = "V4", by = V3]

#13 - modifique o valor da linha oito, coluna quarto para o valor 1.1
set(dt, i = 8, j = 4, value = 1.1L)
dt[8,4]

#14 - elimine as linhas com valores faltantes
na.omit(dt, cols = 1:5) #elimina as linhas com valores NA

#15 - realize a contagem dos grupos em V3
dt[,.N, by = V3]
