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

#bind_rows
library(magrittr)
library(dplyr)
#criando duas tabelas x e y, apartir da tabela de dados1
x = dados1 %>% 
  select (cupom, filial, valor_compra) %>%
  filter(filial == "A")
x
y = dados1 %>%
  select(cupom, n_itens) %>%
  filter(n_itens == 1)
y
#unindo x e y pelas linhas
bind_rows(x,y)
#obs.: para fazer essa combinação, não é necessario que o numero de linhas ou colunas seja iguais em x e y
#obs2.: observe que quando não há correspondencia o comando retorna NA
