#Normalização de dados
#Normalização logarítmica

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

#Aplicando a transformação logarítmica
transx <- log(x)
head(transx)

#Testando a normalidade após a transformação
shapiro.test(transx)
