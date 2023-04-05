#tidyr
#Organização de dados
#complete, drop_na & replace_na

#complete
#Podemos completar valores faltantes da nossa tabela de dados
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

#Completando as combinações de tempo e sexo
#O comando nesting(), que pode ser usado dentro da função complete(),
#cruza todos os valores de determinado grupo (tabela)
#com os pares unicos dos valores das colunas selecionadas em nesting().

dadosdieta %>%
  complete(sexo,nesting(tempo))
