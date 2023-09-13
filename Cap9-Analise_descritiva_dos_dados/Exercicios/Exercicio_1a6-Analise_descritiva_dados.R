#Análise descritiva de dados
#Execicios 1-6

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(dplyr) #Manipulação dados
library(tidyr) #Organização de dados
library(ggplot2) #Elaboração de gráficos
library(mice) #Substitui valores perdidos
library(janitor) #Limpeza de dados
library(DescTools) #Análise descritiva de forma rápida e completa

#data.frame dta
x = c("azul", "preto", "azul", "castanho", "preto",
      "castanho", "castanho", "castanho", "castanho", "preto")
y = c("loiro", "loiro", NA, "preto", "preto",
      "preto", "preto", NA, "preto", "loiro")
set.seed(30); z=round(rnorm(10,200,40),1)
dt = data.frame(x,y,z)
set.seed(30); n = sample(1:10,100,replace = T)

dta = dt[n,]
dta

#[1] Obtenha um mapeamento dos dados faltantes.
## Analisando e preparando dta
str(dta)
dta$x <- as.factor(dta$x) #Passando a variável x para factor
dta$y <- as.factor(dta$y) #Passando a variável y para factor
str(dta)

## Obtendo o mapeamento de dados faltantes
PlotMiss(dta)

#Fechando dispositivo gráfico
dev.off()

#[2] Produza a tabela de frequência para a variável x.
tabyl(dta$x)

#[3] Produza a tabela de frequência para a variável z, considerando os intervalos
#de acordo com o método Sturges.
##Intervalo de classe para variáveis continuas - método Sturges
intervalo = cut(dta$z,b=nclass.Sturges(dta$z))
intervalo

## Montando a frequência
tb_dta_z <- tabyl(intervalo) %>%
  adorn_totals() %>% 
  adorn_rounding(2)
tb_dta_z

#[4] Atribua valores aos dados faltantes e faça a tabela de frequência para a variável y.
summary(dta$y) #Analizando variável y
dta_ajustado <- complete(mice(dta)) #Substituição de variáveis faltantes em y
summary(dta_ajustado$y) #Analise após substituição de variáveis faltantes em y

## tabela de frequência da variável y
tabyl(dta_ajustado$y)

#[5] Atribua valores aos dados faltantes e produza a tabela cruzada entre x e y.
tb_cruz_xy <- tabyl(dta_ajustado,x,y)
tb_cruz_xy

#[6] Obtenha as estatísticas descritivas de todas as variáveis de dta.
Desc(dta_ajustado)

#Fechando dispositivo gráfico
dev.off()
