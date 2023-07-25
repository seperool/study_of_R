#janitor

#Remove colunas (remove_constant) ou linhas (remove_empty) inúteis.

#Bibliotecas
library(janitor)

#Dados
x <- c("b","a","b","c","c",NA,"a","a",NA,"a")
y <- rep("Brasil",10)
z <- c(NA,1:7,NA,NA)
vazia <- rep(NA,10)

#Criando dataframe
dt <- data.frame(x,y,z,vazia)
dt

#Elimina coluna com valores constantes - remove_constant()
#Remove colunas y e vazia
dt_clean1 <- remove_constant(dt)
dt_clean1

#Eliminando as linhas vazias - remove_empty()
#Remove linha 9, sem valores
dt_clean2 <- remove_empty(dt_clean1)
dt_clean2
