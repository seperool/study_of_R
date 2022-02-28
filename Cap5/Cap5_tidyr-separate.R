#tidyr
#Organização de dados
#separate & unite

#separate

#se você precisa organizar a tabela de modo a separar as respostas que estão
#em uma unica coluna para diversas colunas.
#separa dados aglomerados de uma coluna para mais de uma coluna.

library(magrittr) #operador pipe %>%, concatena linhas de comando
library(tidyr) #organização de dados

#a tabela inicial de dados

respostas = data.frame(ordem = 1:6,
                       cor = c("azul, amarelo","verde, cinza","azul, verde","azul, cinza","branco, preto","verde, cinza"))
respostas

#separando as respostas de cores

respostas %>%
  separate(cor, c("cor1","cor2"), sep = ",")
#note que o separador para a resposta cor é a virgula.