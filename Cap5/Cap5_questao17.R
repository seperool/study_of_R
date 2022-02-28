#bibliotecas
library(tibble) #tipo de data.frame, "tabela"
library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados


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

bind_rows(x,y) #sobreposição

#b) x e y se juntem com base nas colunas de y a direita

right_join(x,y) #junção com y a direita

#c) se obtenha a intersecção entre x e y

intersect(x,y) #intersecção x e y

#d) se obtenha a união entre x e y

union(x,y) #união

#e) verifique se bind_rows(x,y) e full_join(x,y) produzem os mesmos dados

w=bind_rows(x,y)
z=full_join(x,y)
setequal(w,z) #verdadeiro ou falso, se as duas tabelas são as mesmas
#não importa a ordem

#f) verifique quais linhas que estão em left_join(x,y) e não estão em right_join(x,y)

q=left_join(x,y)
p=right_join(x,y)
setdiff(q,p) #retorna a diferença entre duas tabelas