#janitor - tabyl

#tabyl é uma versão melhorada da função table() do pacote básico.
#Retorna dataframe que pode ser melhorado e impresso com kable(), do pacote knitr.
#Calcula porcentagens automaticamente (porcentagem total e porcentagem valida, sem NA).
#Pode opcionalmente exibir valores NA.
#Quando NA ocorre, uma coluna adicional valid_percent (porcentagem valida) é adicionada.
#Pode opcionalmente ordernar as contagens (frequência).
#Pode ser usado com operador pipe %>%, do pacote magrittr.
#Quando a variável for do tipo categórica, os valores perdidos são contabilizados na tabela.

#Biblioteca
library(janitor)
library(dplyr)

#Dados
x <- c("b","a","b","c","c",NA,"a","a",NA,"a")
y <- rep("Brasil",10)
z <- c(NA,1:7,NA,NA)
vazia <- rep(NA,10)

#Tabela de frequência da variável x
tabyl(x, sort = TRUE) #Ordena a variável x

tabyl(x) %>% 
  select(x, valid_percent) #Seleciona as colunas x e valid_percent
