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
#pull
#extrai uma coluna de uma tabela de dados na forma de um vetor
library(magrittr)
library(dplyr)
vetor= dados1 %>% pull(filial) #definindo a coluna em especifico 
vetor1= dados1 %>% pull(2) #posição da coluna da esquerda para direita
vetor2= dados1 %>% pull(-5) #posição da coluna da direita para esquerda
vetor
vetor1
vetor2