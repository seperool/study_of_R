#Distribuição de Probabilidade
#Distribuição Normal
#Plotando dois gráficos juntos
## par(mfrow = c(1,2))

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(dplyr) #Manipulação dados
library(tidyr) #Organização de dados
library(ggplot2) #Elaboração de gráficos
library(patchwork) #Layout, juntar ggplot no mesmo gráfico
library(mice) #Substitui valores perdidos
library(janitor) #Limpeza de dados
library(DescTools) #Análise descritiva de forma rápida e completa
library(lubridate) #Transformar e extrair datas, funções para trabalhar com datas

#Distribuição normal
#Layout
par(mfrow = c(1,2))

#mu = 50, sigma = 2 (plot 1,1)
curve(dnorm(x,50,2), 
      xlim = c(20,80), 
      main = "Gráfico 1")

#mu = 50, sigma = 2 (plot 1,2)
curve(dnorm(x,50,2),
      xlim = c(20,80),
      main = "Gráfico 2")

#Fechando dispositivo gráfico
dev.off()
