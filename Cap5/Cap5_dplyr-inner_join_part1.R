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
#inner_join
#junta as tabelas pela intersecção
library(magrittr)
library(dplyr)
x = dados1 %>%
  select(cupom,filial,valor_compra)
x
y = dados1 %>%
  select(cupom, filial,n_itens)
y
#unindo x e y pela intersecção da coluna chave
inner_join(x,y)
#esse comando une x e y através da intersecção das colunas chaves
