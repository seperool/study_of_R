#Análise descritiva de dados
#Execicio 10

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(dplyr) #Manipulação dados
library(tidyr) #Organização de dados
library(ggplot2) #Elaboração de gráficos
library(mice) #Substitui valores perdidos
library(janitor) #Limpeza de dados
library(DescTools) #Análise descritiva de forma rápida e completa
library(lubridate) #Transformar e extrair datas, funções para trabalhar com datas

#data.frame
x = c(paste0(rep(201905,30),c(10:30, paste0(rep(0,9),1:9))))
set.seed(30)
nascimento = ymd(sample(x,10000,replace = T))
sexo = rep(c("F","M",NA), c(5000,4900,100))

dados = data.frame(nascimento,sexo)
dados

#[10] Apresente a tabela cruzada entre dia da semana de nascimento e sexo dos bebês.
## Analisando e preparando dados
str(dados)
dados$sexo <- as.factor(dados$sexo)
str(dados)
summary(dados)

##Extaindo dia da semana
semana <- wday(dados$nascimento)
semana

## Novo data.frame
dt <- data.frame(nascimento,semana,sexo)

## Análisando novo data.frame
str(dt)
dt$semana <- as.factor(dt$semana) #Transformando dia da semana em factor
dt$sexo <- as.factor(dt$sexo) #Transformando sexo em factor
str(dt)
summary(dt)

##Tabela cruzada
tabyl(dt,semana,sexo) %>% 
  adorn_totals(c("row","col")) %>% 
  adorn_rounding(2)

##ou

Desc(sexo ~ semana, dt, digits = 1)

#Fechando dispositivo gráfico
dev.off()
