#janitor - Teste qui-quadrado

#Bibliotecas
library(magrittr) #Operador pipe "%>%", concatena linhas de comando
library(janitor) #Limpeza de dados

#Suponha dois grupos que receberam tratamento
grupo <- c(rep("A",15),rep("B",15))
set.seed(20)
resposta <- c(sample(0:1,25,replace = T),rep(1,5))
dt = data.frame(grupo,resposta)

tab = tabyl(dt, grupo, resposta, show_na= F)
tab

#Aplicando o teste qui-quadrado
chisq.test(tab)
