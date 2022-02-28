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

# Operador pipe
#concatena linhas de comando na ordem de execução

#modo tradicional sem uso do pipe
summary(dados1)

#modo pipe
library(magrittr)
dados1 %>% summary()

#exemplo mais complexo uso do pipe
#dados1, selecionar coluna filial e quinzena, visualizar apenas resultados quinzena 1
# OBS.: lembrar de carregar o pacote no inicio do script "magrittr"
library(magrittr)
#agora aplicamos o procedimento com pipe
dados1 %>%
  dplyr::select(filial, quinzena) %>%
  dplyr::filter(quinzena==1)

#sem uso do pipe
dplyr::filter(dplyr::select(dados1, filial,quinzena), quinzena==1)
#maior dificuldade de entender o que esta acontecendo
