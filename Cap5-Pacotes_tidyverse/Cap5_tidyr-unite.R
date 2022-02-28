#tidyr
#Organização de dados
#separate & unite

#unite

#o comando unite é utilizado para unir duas ou mais colunas.

library(magrittr) #operador pipe %>%, concatena linhas de comando
library(tidyr) #organização de dados

#a tabela inicial de dados

respostas = data.frame(ordem = 1:6,
                       cor = c("azul, amarelo","verde, cinza","azul, verde","azul, cinza","branco, preto","verde, cinza"))

resposta_sep = respostas %>%
  separate(cor, c("cor1","cor2"), sep = ",")
resposta_sep

#unindo respostas sobre cores

resposta_sep %>%
  unite("cor", c("cor1","cor2"),sep = ",")