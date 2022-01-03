#bibliotecas
library(tibble) #tipo de data.frame, "tabela"
library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados

#criando a tabela x
set.seed(1)
x = tibble(a1 = 1:10, a2 = letters[1:10], a3 = ceiling(runif(10,1,5)))
x

#criando a tabela y
set.seed(1)
y = tibble(a1 = rep(2:3,5), a2 = rep(letters[2:3],5), a3 = ceiling(runif(10,2,4)))
y

#combine as tabelas x e y formando uma nova tabela de tal forma que:

#a) x e y se sobreponham

#b) x e y se juntem com base nas colunas de y a direita

#c) se obtenha a intersecção entre x e y

#d) se obtenha a união entre x e y

#e) verifique se bind_rows(x,y) e full_join(x,y) produzem os mesmos dados

#f) verifique quais linhas que estão em left_join(x,y) e não estão em right_join(x,y)