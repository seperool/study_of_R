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