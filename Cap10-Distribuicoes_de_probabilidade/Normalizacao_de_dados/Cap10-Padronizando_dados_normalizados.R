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

x <- rnorm(50,100,5)
x

#mu = 100, sigma^2 = 25 (ou seja, sigma = 5) (plot 1,1)
curve(dnorm(x,100,5), 
      xlim = c(80,120), 
      main = "Gráfico 1")

#Distribuição normal padronizada
transx <- (x - 100)/5
transx

#mu = 0, sigma = 1 (plot 1,2)
PlotFdist(transx, #vetor dados da variável
          args.curve = list(expr = "dnorm(x,mean(transx),sd(transx))", #dados da distribuição normal
                            col = "black"), #Distribuição normal em preto
          args.rug = NA,
          args.dens = NA, #grafico densidade em cinza
          args.boxplot = NA, #Omitir boxplot
          args.ecdf = NA, #Omitir distribuição acumulada
          xlim = c(-4, 4),
          main = "Gráfico 2")

#Fechando dispositivo gráfico
dev.off()
