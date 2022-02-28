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

#tibble
#adicionar coluna: add_column
#definindo o lugar onde deve ser adicionado a nova coluna
library(magrittr)
library(dplyr)
dados1 %>%
  tibble::add_column(adicionada = 1:23, .before = 1)
#obs.: também pode definir antes da coluna em especifico, .before = "cupom"