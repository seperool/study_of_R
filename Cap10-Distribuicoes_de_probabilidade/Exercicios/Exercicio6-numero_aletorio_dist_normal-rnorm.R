#Distribuição de Probabilidade
#Distribuição Normal
#Número aleatório

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

#20 números aletórios de uma distribuição normal padronizada, X~N(0,1)
set.seed(30)
y <- rnorm(20,0,1)
y

#Gráfico comparativo
PlotFdist(y,
          args.curve = list(expr = "dnorm(x,mean(y),sd(y))",
                            col = "black"),
          args.dens = list(col = "gray"),
          args.ecdf = NA,
          xlim = c(-4,4))
#Organizando legenda
legend(x = "topright",
       legend = c("kernel density",
                  expression(X%~%N(mu==0, sigma==1))),
       fill = c("gray80","black"),
       text.width = 0.2)

#Fechando dispositivo gráfico
dev.off()
