#valid_percent

#Biblioteca
library(janitor)
library(dplyr)

#Dados
x <- c("b","a","b","c","c",NA,"a","a",NA,"a")
y <- rep("Brasil",10)
z <- c(NA,1:7,NA,NA)
vazia <- rep(NA,10)

#Tabela de frequência da variável x
tabyl(x, sort = TRUE)

tabyl(x) %>% 
  select(x, valid_percent)
