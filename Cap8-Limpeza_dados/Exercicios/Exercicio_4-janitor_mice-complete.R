#janitor e mice
#Substituição de valores faltantes
#complete(mice())

#Bibliotecas
library(janitor) #Limpeza de dados
library(mice) #Substituir valores perdidos

#data.frame
x <-c("azul","preto", "azul","castanho","preto",
      "castanho","castanho","castanho","castanho","preto")
y <- c("loiro","loiro",NA,"preto","preto",
       "preto","preto",NA,"preto","loiro")
dt = data.frame(x,y)
dt

dt$x <- as.factor(dt$x)
dt$y <- as.factor(dt$y)


set.seed(30)
n <- sample(1:10,100,replace = T)
dat <- dt[n,]

#Analise prévia
str(dat)
summary(dat)

#Substituindo valores faltantes
dat_ajustado <- complete(mice(dat))
dat_ajustado

#Analise posteriori
summary(dat_ajustado)

#Comparando
dat
dat_ajustado

summary(dat)
summary(dat_ajustado)
