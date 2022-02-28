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
#filter
#filtra os dados, necessario conhecer alguns comandos logicos.
  #comandos logicos:
    #iqualdade: ==
    #diferença: !=
    #desiqualdade: >;<;>=;<=
    #consições logicas:& (e); | (ou); ! (negação)
library(magrittr)
library(dplyr)
#somente a filial A
dados1 %>%
  filter(filial=="A")
#filial A ou n_itens iqual a 1
dados1 %>%
  filter(filial =="A" | n_itens == 1)
#filial B e quinzena iqual a 2
dados1 %>%
  filter(filial=="B" & quinzena == 2)
