#bibliotecas
library(magrittr)
library(tibble)
library(dplyr)
library(tidyr)

#b) crie uma tabela de dados para respresentar as respostas na forma larga
#criação da tabela
pesquisa_larga = tibble(entrevistados = 1:3, m01 = c(1,1,1),m02 = c(1,0,0),
                            m03=c(0,1,0),m04=c(0,0,1),m05=c(1,1,1),m06=c(0,0,1),
                            m07=c(1,1,0),m08=c(1,1,0),m09=c(0,0,0),m10=c(0,0,0))
pesquisa_larga
View(pesquisa_larga)
#a) crie uma tabela de dados para respresentar as respostas na forma longa
pesquisa_longa = pesquisa_larga %>%
  pivot_longer(cols = c(m01,m02,m03,m04,m05,m06,m07,m08,m09,m10),
               names_to = "marcas", values_to = "preferencia")
pesquisa_longa
View(pesquisa_longa)
#c) quantas e quais marcas distintas foram mencionadas pelos entrevistados?

consul_marcas = pesquisa_longa %>%
  group_by(marcas) %>%
  summarise("Qtd" = sum(preferencia)) %>%
  filter(Qtd > 0) %>%
  arrange(Qtd)

marcas_vet = consul_marcas %>%
  pull(marcas)

length(marcas_vet)

#d) quantas menções cada marca recebeu, em ordem decrescente de menções?

mencoes = pesquisa_longa %>%
  group_by(marcas) %>%
  summarise(Q_mencoes = sum(preferencia))

mencoes = mencoes %>%
  arrange(-Q_mencoes)

mencoes