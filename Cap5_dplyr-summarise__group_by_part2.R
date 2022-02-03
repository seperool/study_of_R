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
#obter media e desvio-padrão do valor_compra agrupado por quinzena, com duas casas decimais
library(magrittr)
library(dplyr)
dados1 %>%
  group_by(quinzena) %>%
  summarise(media = mean(valor_compra) %>%
              round(2))