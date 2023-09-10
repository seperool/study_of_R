#Analisando datas com o pacote DescTools
#O pacote lubridate

#Bibliotecas
library(readr) #Leitura de dados
library(DescTools) #Análise descritiva de forma rápida e completa
library(lubridate) #Transformar e extrair datas, funções para trabalhar com datas

#Importação de dados
dados <- read_csv2(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/vendas_NA.csv")
head(dados)
View(dados)

#Transformando a coluna dados$data no formato data ano, mês e dia
str(dados$data)
x <- dmy(as.character(dados$data))
x

#Analisando a variável data sem gráficos
Desc(x, plotit = F)
#Analise descritiva de datas, leva em consideração três componentes
## semana
## mês
## dia

#Analise descritiva de datas com gráficos
Desc(x)
# Plota três gráficos
## semana
## mês
## dia
