#tidyr
#Organização de dados
#complete, drop_na & replace_na

#complete
#podemos completar valores faltantes da nossa tabela de dados
#em diversas situações em que haja falta de combinações de casos na tabela
#gera todas as combinações possiveis que envolvam determinadas colunas
#caso não haja determinado dado, completa com "NA"

library(magrittr)
library(tidyr)

#a tabela inicial de dados
dadosdieta = data.frame(
  pacientes = 1:5,
  antes = c(150,160,90,95,110),
  depois = c(140,110,80,80,82),
  tempo = c(4,4,3,3,6),
  sexo = c("homem","homem","mulher","mulher","mulher")
)
dadosdieta

#completando as combinações de tempo e sexo

dadosdieta %>%
  complete(sexo,nesting(tempo))

#drop_na & replace_na
#para liminar linhas que contenham valores ausentes (NA), usamos a função drop_na
#ou podemos substituir os NA's por valores com a função replace_na

#tabela inicial
dadosdieta = dadosdieta %>%
  complete(sexo,nesting(tempo))

#eliminando as linhas com NA com base em todas as colunas 
#ou considerando algumas colunas

dadosdieta %>%
  drop_na()
#observe que quando aplicamos a função drop_na() foram eliminadas todas as linhas
#que apresentavam algum NA.

dadosdieta %>%
  drop_na(c(sexo,tempo))
#ao especificar as colunas sexo e tempo nenhum NA foi eliminado
#pois essas colunas não apresentam valor ausentes.

#substituindo NA nas colunas especificas

dadosdieta %>%
  replace_na(list(pacientes = "ausente", antes = 0, depois = 0))
#ao aplicar a função replace_na(), podemos escolher tanto a coluna a ser aplicada
#como  também definir o valor da substituição.
#note que quando definimos em "pacientes" com NA o valor ausente
#modificou-se a natureza da variavel de inteiro para caractere.

#substituindo NA das colunas antes e depois

dadosdieta %>%
  replace_na(list(antes=0,depois=0))