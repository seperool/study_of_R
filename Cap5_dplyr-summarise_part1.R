# Importação de dados pelo import dataset
View(vendas1)

# Leitura de dados de arquivo em URL
dados = read.csv2(file = "https://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")
head(dados)
dados1 = readr::read_csv2(file = "https://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")
head(dados1)
dados2 = read.csv(file = "https://raw.githubusercontent.com/Lucianea/Alta/master/vendas1.csv")
head(dados2)
dados3 = readr::read_csv(file = "https://raw.githubusercontent.com/Lucianea/Alta/master/vendas1.csv")
head(dados3)

#dplyr
#Manipulando dados com o dplyr
#summarise
  #o summarise nos permite responder perguntas sobre nossos dados atraves da...
  #aplicação de funções que resumem as variaveis.
  #possibilitando produzir tabelas resumidas do banco de dados
library(magrittr)
library(dplyr)
#observando o numero de observaçoes da base de dados
dados1 %>%
  summarise(contagem = n())

