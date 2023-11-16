#Normalização de dados
#Normalização BoxCox
#Teste de Shapiro-Wilk

#Verifica se uma variável aleatória é uma distribuição normal ou não.
#Se p-valor > 0.05, H0, ou seja, a distribuição de probabilidade da variável x é normal.
#Se p-valor <= 0.05, H1, ou seja, a distribuição de probabilidade da variável x não é normal.

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(DescTools) #Análise descritiva de forma rápida e completa

#Importação de dados
dados <- read.csv2(file = "~/Programacao/R/Dados/Dados_de_importacao/vendas.csv")
head(dados)
str(dados)
summary(dados)

#Tratamento de dados
dados$filial <- as.factor(dados$filial)
str(dados)

#Separação valor compra
x <- dados$valor_compra
head(x)
shapiro.test(x)
#p-value = 0.0003682
#Logo, p-valor <= 0.05, ou seja, a distribuição de probabilidade da variável x não é normal.

#Lambda ótimo da transformação BoxCox
lambda <- BoxCoxLambda(x)
lambda

#Aplicando a transformação ao vetor
transx <- BoxCox(x, lambda)
head(transx)

#Testando a normalidade após a transformação
shapiro.test(transx)
#p-value = 0.6672
#Logo, p-valor > 0.05, ou seja,
#a distribuição de probabilidade da variável x transformada pelo BoxCox é normal.