#Relações entre duas variáveis
#Numérica (resposta) ~ categórica (explicação) (Y~X)
#Para a análise Kruskal-Wallis:
##O número de grupos (categórias) deve ser k >= 2;
##O teste compara se a mediana da variável resposta é igual ou não em cada grupo;
##Variável resposta deve ser numérica.

#1)A localidade de um estabelecimento fornece resposta quanto ao valor médio de 
#compra dos clientes?

#Resposta (Y): valor_compra
#Explicação (X): filial
#Nível de significância: 0.05

#Hipóteses:
#H0: O valor de compra médio é igual em todas as filiais do estabelecimento.
#H1: O valor da compra média não é igual em todas as filiais do esbelecimento.

#2)Há diferença no nível de desconto entre as quinzenas do mês?

#Resposta (Y): Percentual de desconto
#Explicação (X): Quinzena
#Nível de significância: 0.05

#Hipóteses:
#H0: O percentual de desconto é igual nas duas quinzenas do mês.
#H1: O percentual de desconto não é igual nas duas quinzenas do mês.

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

#Importando dados
dados <- read.csv2(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/vendas.csv")
head(dados)
str(dados)

#Tratando os dados
dados$filial <- as.factor(dados$filial) #Transformando dados filial em tipo fator
dados$quinzena <- as.factor(dados$quinzena) #Transformando dados quinzena em tipo fator
str(dados)

#1)
#Análise rápida dos dados
Desc(valor_compra ~ filial, dados,
     digits = 1,
     plotit = TRUE, 
     test = kruskal.test) #Teste de Kruskal-Wallis
#Pelo teste de Kruskal-Wallis: p-value = 0.5537 > 0.05 (nível de significância),
#logo, aceitamos a hipotese H0 como verdadeira.
#H0: O valor de compra médio é igual em todas as filiais do estabelecimento.

#Fechando dispositivo gráfico
dev.off()

#-------------------------------------------------------------------------------
#2)
#Análise rápida dos dados
Desc(desconto_perc ~ quinzena, dados,
     digits = 1,
     plotit = TRUE,
     test = kruskal.test) #Teste de Kruskal-Wallis
#Pelo teste de Kruskal-Wallis: p-value = 0.03245 <= 0.05 (nível de significância),
#logo, aceitamos a hipotese H1 como verdadeira.
#H1: O percentual de desconto não é igual nas duas quinzenas do mês.

#Fechando dispositivo gráfico
dev.off()

#-------------------------------------------------------------------------------
#Comparando gráficamente a distribuição de densidade de uma variável numérica
#condicionada a categórias de outra variável.

#Análise variáveis
Desc(dados$desconto_perc, plotit = F) #Análise variável numérica
Desc(dados$quinzena, plotit = F) #Análise variável categórica

#Gráficos densidade
curve(dnorm(x, mean(dados$desconto_perc), sd(dados$desconto_perc)),
      xlim = c(-20,20),
      main = "Gráfico densidade desconto percentual")

#Gráficos de densidade do desconto percentual sobrepostos
#para cada grupamento da quinzena
PlotMultiDens(desconto_perc ~ quinzena, dados,
              xlab = "Percentual de desconto",
              main = "Percentual de desconto ~ quinzena",
              panel.first = grid(),
              col = c("black", SetAlpha("gray",0.95), lwd = 2))

#Fechando dispositivo gráfico
dev.off()

#Teste de Shapiro-Wilk
shapiro.test(dados$desconto_perc)
#Não há normalidade
#p-value = 7.375e-05 < 0.05