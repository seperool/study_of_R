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
#arrange
#organiza dados de acordo  com a ordem de uma variavel escolhida para determinado fim
library(magrittr)
library(dplyr)
#organizar dados em ordem crescente
dados1 %>%
  arrange(n_itens)
#organizando dados pela ordem decrescente
  #1ºforma:
dados1 %>%
  arrange(-n_itens)
  #2ºforma:
dados1 %>%
  arrange(desc(n_itens))
#mais de um arranjo simultaneo
dados1 %>%
  arrange(-n_itens) %>%
  arrange(filial)
  #ou:
dados1 %>%
  arrange(-n_itens,filial)
