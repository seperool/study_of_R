#Análise descritiva dos dados
#Tabulação dos dados - variável categórica

#Bibliotecas
library(knitr) #Interpretação e compilação do documento rmd, formato tabela kable
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(readr) #Leitura de dados
library(janitor) #Limpeza de dados

#Leitura da base de dados
dados <- read.csv2(file = "~/Programacao/R/Dados/Dados_de_importacao/vendas.csv")
dados <- data.frame(dados)

#Exibindo as 6 primeiras linhas da base de dados
head(dados)

#Exibindo a estrutura dos dados
#Tipo das variáveis
str(dados)

#Tabela de frequência variável categórica
tb_filial = tabyl(dados,filial) %>% 
  adorn_totals() %>% 
  adorn_rounding(2)

tb_filial

#Plotar tabela
kable(tb_filial, caption = "Tabela de frequência para variável categórica",align = "ccc")
