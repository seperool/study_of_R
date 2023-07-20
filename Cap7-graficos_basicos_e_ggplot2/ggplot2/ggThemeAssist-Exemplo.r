#Bibliotecas
library(ggplot2) #Elaboração de gráficos
library(magrittr) #Operador pipe %>%, concatena linhas de comando
library(readr) #Leitura de dados
library(patchwork) #Layout, juntar ggplot no mesmo gráfico 
library(dplyr) #Manipulação de dados
library(tibble) #Estruturação de data.frame
library(tidyr) #Organização de dados
library(ggThemeAssist)
library(ggthemes)
library(esquisse)

#Importando dados
dados <- read.csv(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
dados <- data(dados)
View(dados)
summary(dados)
dados

