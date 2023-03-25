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
#comandos: bind_cols & bind_rows
#une duas tabelas lado a lado, ou sobrepostas

#bind_cols
library(magrittr)
library(dplyr)
#criando duas tabelas x e y, apartir de dados1
x = dados1 %>% select(cupom, filial, valor_compra)
x
y = dados1 %>% select(cupom,n_itens)
y
#unindo x e y pelas colunas
View(bind_cols(x,y))
#obs.: para que essa combinação seja possivel é necessario o mesmo numero de linhas nas duas tabelas
#obs2.: como tem a coluna "cupom" nas duas tabelas é acrescentado automaticamente um numero ao nome da coluna para diferenciar

z <- bind_cols(x,y)
colnames(z)