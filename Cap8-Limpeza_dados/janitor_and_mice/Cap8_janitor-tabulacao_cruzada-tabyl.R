#janitor - tabyl
#Tabulação cruzada

#Biblioteca
library(janitor)
library(dplyr)

#Criando uma tabela
cor_selo <- c("azul",
              "preto",
              "azul",
              "vermelho",
              "preto",
              "vermelho",
              NA,
              "preto",
              "vermelho",
              "preto",
              "azul")
categoria <- c("A", "B", NA,"C","A","A","C",NA,"B","B","A")

dt <- data.frame(x=cor_selo,y=categoria)
dt

#Tabulação cruzada entre x e y
#frequência de y em x
tabyl(dt,x,y)
