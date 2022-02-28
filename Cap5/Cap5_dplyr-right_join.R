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
#left_join & right_join
#right_join
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
right_join(x,y)
#a coluna filial é a coluna chave
#ao juntar x e y pela esqueda, a tabela final resultou nas colunas de y que possuem correspondentes em x
#a base da junção é a tabela y
