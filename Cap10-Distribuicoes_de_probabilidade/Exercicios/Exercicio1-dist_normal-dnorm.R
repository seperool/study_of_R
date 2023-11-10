#Distribuição de Probabilidade
#Distribuição Normal

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
#mu = 50, sigma = 2
curve(dnorm(x,50,2),
      xlim = c(20,80),
      main = "Gráfico da Distribuição Normal Padronizada")

#Fechando dispositivo gráfico
dev.off()
