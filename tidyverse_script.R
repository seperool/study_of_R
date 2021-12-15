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

# Exibir mais linhas
print(dados1, n=15)

# Exibir numero x de colunas
getOption("width")
print (dados, width=35)

#Criando uma tabela com tibble
library(tibble) #carregar pacote tibble
x1 = tibble(x=1:3,y=10:12,z=c("A1","A2","A3"))
x1

#Criando uma tabela com data.frame
x2=data.frame(x=1:3,y=10:12,z=c("A1","A2","A3"))
x2

#Transformando x2 em tibble
x2=as_tibble(x2) #transforma data.frame em tibble
is_tibble(x2) #booleano, é tibble? true ou false

#identificação e transformação de tipo da viariavel
#identificação da variavel
is.numeric(dados$valor_compra)
is.numeric(dados1$valor_compra)
is.factor(dados$filial) #factor é uma variavel categorica, diferente de caractere
is.character(dados$filial)
is.factor(dados1$filial)
is.character(dados1$filial)

#transformando uma variavel filial de dados1 de tipo caractere para tipo fator.
is.character(dados1$filial)
is.factor(dados1$filial)

dados1$filial=as.factor(dados1$filial)

is.character(dados1$filial)
is.factor(dados1$filial)

#OBS.: transformar uma variavel caractere em numerica e vice-versa
is.character(dados3$filial)
filial = as.factor(dados3$filial) #converte de caractere para fator
filial
is.factor(filial)

filial= as.numeric(filial) #de fator para numerico
is.numeric(filial)
filial

filial = as.character(filial) #por fim, de numerico de volta para caractere
is.character(filial)
filial

#---

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

#---

#Manipulando dados com o dplyr
#select
library(magrittr)
library(dplyr)
dados1 %>% #indica a tabela, concatena...
  dplyr::select(filial,quinzena, valor_compra) #seleciona as colunas a serem mostradas

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

#distinct
#comando elimina a redundancia de dados de uma determinada coluna ou conjunto de colunas
library(magrittr)
library(dplyr)
#extraindo linhas distintas para a coluna n_itens
dados1 %>%
  distinct(n_itens)
#extraindo as linhas distintas para as colunas filial, quinzena e descontro_perc
dados1 %>%
  distinct(filial, quinzena, desconto_perc)
#extrair todas as linhas distintas do banco de dados dados1
dados1 %>%
  distinct()

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

#---

#funções dplyr juntas ao mesmo tempo
library(magrittr)
library(dplyr)
dados1 %>%
  arrange(n_itens,valor_compra) %>%
  filter(valor_compra > 100) %>%
  select(filial,n_itens,valor_compra)