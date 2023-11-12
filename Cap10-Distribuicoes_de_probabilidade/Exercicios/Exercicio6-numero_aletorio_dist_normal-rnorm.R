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
PlotFdist(y, #vetor dados da variável
          args.curve = list(expr = "dnorm(x,mean(y),sd(y))", #dados da distribuição normal
                            col = "black"), #Distribuição normal em preto
          args.dens = list(col = "gray"), #grafico densidade em cinza
          args.boxplot = NA, #Omitir boxplot
          args.ecdf = NA, #Omitir distribuição acumulada
          xlim = c(-4,4)) #Limites do eixo x

#Organizando legenda
legend(x = "topright",
       legend = c("kernel density", #Camada 1 - densidade
                  expression(X%~%N(mu==0, sigma==1))), #Camada 2 - função distribuição normal
       fill = c("gray80","black"), #Cor das camadas na legenda
       text.width = 0.2) #tamanho caixa da legenda

#Fechando dispositivo gráfico
dev.off()
