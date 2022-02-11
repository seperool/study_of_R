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
#Combinando tabela de dados
#full_join
#união de todas as colunas de x e y
#que possum pelo menos uma coluna em comum, coluna chave
library(magrittr)
library(dplyr)
x = dados1 %>%
  select(cupom, filial, valor_compra) %>%
  filter(valor_compra > 500)
x
y = dados1 %>%
  select(filial, n_itens) %>%
  filter(n_itens < 8)
y
full_join(x,y)
#filial é a coluna chave
#a tabela é as combinações de x e y, combinações possiveis de serem feitas
#cuidado com as combinações
