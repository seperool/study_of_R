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
#casos especiais summarise & group_by
#mais de um summarise
#observando o numero de cupons vendidos, o total de itens vendidos e o total do valor de compras em cada filial
library(magrittr)
library(dplyr)
dados1 %>%
  group_by(filial)%>%
  summarise(cupom_distintos = n_distinct(cupom),
            itens_total = sum(n_itens),
            compra_total = sum(valor_compra))