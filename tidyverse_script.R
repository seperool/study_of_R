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
#dplyr
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

#---

#mutate e transmute
  #mutate
  #atraves de mutate é possivel criar novas colunas na base de dados
library(magrittr)
library(dplyr)
dados1 %>%
  mutate(vmci = round(valor_compra/n_itens))
  
  #transmute
  #faz o mesmo que mutate, mas não adiciona a nova variavel as colunas originais
library(magrittr)
library(dplyr)
dados1 %>%
  transmute(vmci = valor_compra/n_itens)

#summarise & group_by
  #summarise
  #o summarise nos permite responder perguntas sobre nossos dados atraves da...
  #aplicação de funções que resumem as variaveis.
  #possibilitando produzir tabelas resumidas do banco de dados
library(magrittr)
library(dplyr)
#observando o numero de observaçoes da base de dados
dados1 %>%
  summarise(contagem = n())

#observando numero de filiais distintas
library(magrittr)
library(dplyr)
dados1 %>%
  select(filial)%>%
  summarise(filiais_distintas = n_distinct(filial))

#observando o numero de cupons distintos na filial "B"
library(magrittr)
library(dplyr)
dados1 %>%
  select(filial, cupom) %>%
  filter(filial == "B") %>%
  summarise(cupons_distintos = n_distinct(cupom))

#Group_by
  #para agruparmos dados
#observando o numero de cupons distintos por cada filial
library(magrittr)
library(dplyr)
dados1 %>%
  group_by(filial)%>%
  summarise(cupons_distintos = n_distinct(cupom))

#Observando o total de compras por cada filial
library(magrittr)
library(dplyr)
dados1 %>%
  group_by(filial) %>%
  summarise(compra_total = sum(valor_compra))

#Observando o total de itens vendidos por cada filial
library(magrittr)
library(dplyr)
dados1 %>%
  group_by(filial) %>%
  summarise(item_total= sum(n_itens))

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

#obter media e desvio-padrão do valor_compra agrupado por quinzena, com duas casas decimais
dados1 %>%
  group_by(quinzena) %>%
  summarise(media = mean(valor_compra) %>%
              round(2))

#---

#tibble
#adicionar coluna: add_column
library(magrittr)
library(dplyr)
dados1 %>%
  tibble::add_column(adicionada = 1:23)

#definindo o lugar onde deve ser adicionado a nova coluna
library(magrittr)
library(dplyr)
dados1 %>%
  tibble::add_column(adicionada = 1:23, .before = 1)
#obs.: também pode definir antes da coluna em especifico, .before = "cupom"

#adicionando linha: add_row
library(magrittr)
library(dplyr)
dados1 %>%
  tibble::add_row(cupom=100,filial="A",valor_compra=10,n_itens=1,desconto_perc=0,quinzena=1,.before = 1)

#renomeando uma coluna: rename
library(magrittr)
library(dplyr)
dados %>%
  rename(venda = valor_compra)

#---
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

#---
#inner_join
#junta as tabelas pela intersecção
library(magrittr)
library(dplyr)
x = dados1 %>%
  select(cupom,filial,valor_compra)
x
y = dados1 %>%
  select(cupom, filial,n_itens)
y
#unindo x e y pela intersecção da coluna chave
inner_join(x,y)
#esse comando une x e y através da intersecção das colunas chaves

#inner_join com condições
library(magrittr)
library(dplyr)
x = dados1 %>%
  select(cupom, filial, valor_compra) %>%
  filter(valor_compra >500)
x
y = dados1 %>%
  select(filial,n_itens) %>%
  filter(n_itens < 8)
y
inner_join(x,y)
#quando unidos as condições se somam
#cuidado quando unir tabelas para não mesclar informações que não queira

#---
#left_join & right_join
#left_join
#a tabela final será o resultado de todas as colunas da tabela a esquerda
#que possuam pelo menos uma coluna em comum, a coluna chave
library(magrittr)
library(dplyr)
x = dados1 %>%
  select(cupom, filial, valor_compra) %>%
  filter(valor_compra > 500)
x
y = dados1 %>%
  select(filial, n_itens) %>%
  filter(n_itens < 8)
y
left_join(x,y)
#a coluna filial é a coluna chave
#ao juntar x e y pela esqueda, a tabela final resultou nas colunas de x que possuem correspondentes em y
#a base da junção é a tabela x

#right_join
library(magrittr)
library(dplyr)
x = dados1 %>%
  select(cupom, filial, valor_compra) %>%
  filter(valor_compra > 500)
x
y = dados1 %>%
  select(filial, n_itens) %>%
  filter(n_itens < 8)
y
right_join(x,y)
#a coluna filial é a coluna chave
#ao juntar x e y pela esqueda, a tabela final resultou nas colunas de y que possuem correspondentes em x
#a base da junção é a tabela y

#---
#full_join
#união de todas as colunas de x e y
#que possum pelo menos uma coluna em comum, coluna chave
library(magrittr)
library(dplyr)
x = dados1 %>%
  select(cupom, filial, valor_compra) %>%
  filter(valor_compra > 500)
x
y = dados1 %>%
  select(filial, n_itens) %>%
  filter(n_itens < 8)
y
full_join(x,y)
#filial é a coluna chave
#a tabela é as combinações de x e y, combinações possiveis de serem feitas
#cuidado com as combinações

#---
#intersect, union e setdiff
library(magrittr)
library(dplyr)
x = dados1 %>%
  select(cupom, filial, valor_compra)%>%
  filter(valor_compra > 500)
x
y = dados1 %>%
  select(cupom, filial, valor_compra)%>%
  filter(valor_compra < 700)
y
#obtendo a intersecção
intersect(x,y)

#obtendo a união
union(x,y)

#obtendo a diferença, tudo que esta em x e não esta em y
setdiff(x,y)

#obtendo a diferença, tudo que esta em y e não esta em x
setdiff(y,x)

#---
#setequal
#verifica se as tabelas possuem os mesmos conjuntos de dados
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

#---
#tidyr
#Organização de dados
#pivot_longer() e pivot_wider() ou gather() e spread()
#converte os dados em tabelas longas ou tabelas largas.

#obs: é possivel converter varias colunas do dateframe original em duas colunas
#uma recebe os nomes das veriavais em colunas
#e a outra recebe os valores dessas variaveis
#ao final o numero de linhas do dataframe é ampliado
#tabelas largas -> tabelas longas

#obs.2:essas colunas originais devem ter em comum a mesma variavel

#pivot_longer ou gather
#para transformar uma tabela de dados larga para o formato longo são necessarias
#pelo menos duas colunas contendo os nomes das categorias de uma variavel separados por colunas
#tabela larga -> tabela longa
library(magrittr)
library(tidyr) #organização de dados

#a tabela inicial de dados

dadostur = data.frame(
  estado = c("SP", "RS", "RJ"),
  terrestre = c(3900,2800,2600),
  aereo = c(4200,3800,3950)
)
dadostur

#reorganizando a tabela para o formato longo

dadostur %>%
  pivot_longer(cols = c(terrestre,aereo), names_to="meio", values_to = "chegada")

#o mesmo procedimento utilizando a função gather
dadostur %>%
  gather(meio, chegadas, terrestre:aereo)

#obs.: 
#"pivot_longer" organiza os dados na tabela final pela coluna mantida intecta
#"gather" organiza os dados na tabela final pelas colunas juntadas

#obs.2: normalmente diminui o numero de colunas e aumenta o numero de linhas

#---
#tidyr
#Organização de dados
#pivot_longer() e pivot_wider() ou gather() e spread()
#converte os dados em tabelas longas ou tabelas largas.

#obs: é possivel converter varias colunas do dateframe original em duas colunas
#uma recebe os nomes das veriavais em colunas
#e a outra recebe os valores dessas variaveis
#ao final o numero de linhas do dataframe é ampliado
#tabelas largas -> tabelas longas

#obs.2:essas colunas originais devem ter em comum a mesma variavel

#pivot_longer ou gather
#para transformar uma tabela de dados larga para o formato longo são necessarias
#pelo menos duas colunas contendo os nomes das categorias de uma variavel separados por colunas
#tabela larga -> tabela longa
library(magrittr)
library(tidyr) #organização de dados

#a tabela inicial de dados
dadosdieta = data.frame(
  paciente=1:5,
  antes =c(150,160,90,95,100),
  depois=c(140,110,80,80,82),
  tempo=c(4,4,3,3,6),
  sexo=c("homem","homem","mulher","mulher","mulher")
)
dadosdieta

#reorganizando a tabela para o formato longo

dadosdieta %>%
  pivot_longer(cols = c(antes,depois), names_to = "dieta", values_to = "peso")

#o mesmo procedimento utilizando a função gather

dadosdieta %>%
  gather(dieta,peso,antes:depois)

#obs.: 
#"pivot_longer" organiza os dados na tabela final pela coluna mantida intecta
#"gather" organiza os dados na tabela final pelas colunas juntadas

#obs.2: normalmente diminui o numero de colunas e aumenta o numero de linhas

#---
#tidyr
#Organização de dados
#pivot_longer() e pivot_wider() ou gather() e spread()
#converte os dados em tabelas longas ou tabelas largas.

#obs: a função pivot_wider ou spread faz o inverso de pivot_longer ou gather
#ou seja, espelha os dados das linhas por colunas
#ao final o numero de colunas do dataframe é ampliado
#tabelas longas -> tabelas largas

#obs.2:essas colunas originais devem ter em comum a mesma variavel

#pivot_wider ou spread

library(magrittr)
library(tidyr) #organização de dados

#a tabela inicial de dados
dadosdieta = data.frame(
  paciente=1:5,
  antes =c(150,160,90,95,100),
  depois=c(140,110,80,80,82),
  tempo=c(4,4,3,3,6),
  sexo=c("homem","homem","mulher","mulher","mulher")
)
dadosdieta

#reorganizando a tabela para o formato longo

dados_longo = dadosdieta %>%
  pivot_longer(cols = c(antes,depois), names_to = "dieta", values_to = "peso")
dados_longo

#reorganizando a tabela para o formato largo

dados_longo %>%
  pivot_wider(names_from = "dieta",values_from = "peso")

#o mesmo procedimento utilizando a função spread
dados_longo %>%
  spread(dieta, peso)