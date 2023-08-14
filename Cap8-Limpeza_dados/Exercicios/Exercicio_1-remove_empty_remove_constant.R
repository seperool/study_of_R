#Janitor

#Exercicio 1
#Utilize a função remove_empty e/ou remove_constant() para eliminar linhas
#ou colunas vazias da tabela q.

#Biblioteca
library(janitor) #Limpeza de dados

#data.frame
q <- data.frame(x1 = c(1,NA,3,4),
                x2 = c(NA,NA,NA,NA),
                x3 = c("linha1", NA, "linha3",
                       "linha e coluna 2 foram eliminadas"))
q

#Limpeza de dados
##Eliminar colunas
dt_clean1 <- remove_constant(q)
dt_clean1

##Eliminar linhas
dt_clean2 <- remove_empty(q, which = "rows")
dt_clean2
