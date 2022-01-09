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
#distinct
#comando elimina a redundancia de dados de uma determinada coluna ou conjunto de colunas
library(magrittr)
library(dplyr)
#extraindo linhas distintas para a coluna n_itens
dados1 %>%
  distinct(n_itens)
#extraindo as linhas distintas para as colunas filial, quinzena e descontro_perc
dados1 %>%
  distinct(filial, quinzena, desconto_perc)
#extrair todas as linhas distintas do banco de dados dados1
dados1 %>%
  distinct()
