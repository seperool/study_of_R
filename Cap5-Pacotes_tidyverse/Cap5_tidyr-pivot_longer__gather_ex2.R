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