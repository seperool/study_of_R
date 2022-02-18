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
#inner_join com condições
library(magrittr)
library(dplyr)
x = dados1 %>%
  select(cupom, filial, valor_compra) %>%
  filter(valor_compra >500)
x
y = dados1 %>%
  select(filial,n_itens) %>%
  filter(n_itens < 8)
y
inner_join(x,y)
#quando unidos as condições se somam
#cuidado quando unir tabelas para não mesclar informações que não queira
