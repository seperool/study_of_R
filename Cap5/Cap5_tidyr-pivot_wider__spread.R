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