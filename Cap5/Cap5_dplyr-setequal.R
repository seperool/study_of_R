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
#setequal
#verifica se as tabelas possuem os mesmos conjuntos de dados
#linhas com os mesmos valores
#sem se emportar com a ordem dos dados
library(magrittr)
library(dplyr)
x = dados1 %>% filter(valor_compra > 0)
y = dados1 %>% filter(valor_compra > 500)
#testando se as duas tabelas são iguais
setequal(x,dados1)
setequal(y,dados1)

#unindo as colunas de x e y
z= full_join(y,x)
z

setequal(z,dados1)
