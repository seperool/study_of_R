#janitor e mice
#Substituição de valores faltantes
#complete(mice())

#Bibliotecas
library(janitor) #Limpeza de dados
library(mice) #Substituir valores perdidos

#data.frame
q <- data.frame(x1 = c(1,NA,3,4,7),
                x2 = c(3,10,NA,2,10),
                x3 = c("a",NA,"b","a","b"))
q$x3 <- as.factor(q$x3)
q

#Analise prévia
str(q)
summary(q)

#Substituindo valores faltantes
q_ajustado <- complete(mice(q))
q_ajustado

#Analise posteriori
summary(q_ajustado)

#Comparando
q
q_ajustado
