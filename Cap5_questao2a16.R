#2 - nota dos alunos
n = 20; k = 50

for(i in 1:k) {set.seed(2*i);assign(paste0("q", i),rbinom(n,1,p=0.6))}
q=paste0("q",150)
prova=data.frame(aluno=1:20,q1,q2,q3,q4,q5,q6,q7,q8,q9,
                 q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
                 q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
                 q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
                 q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50)
prova[1:6,1:10]

#---
#3 - organize od dados de prova em duas colunas, uma com os alunos e outra com
#as questões

library(magrittr) #operador pipe %>%, contatena linhas de comando
library(tidyr) #organização dados

prova %>%
  unite("questoes",c(q1,q2,q3,q4,q5,q6,q7,q8,q9,
                     q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
                     q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
                     q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
                     q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50),sep = ",")
View(prova)
prova

#---
#4 - organize as questões em dois blocos, o primeiro com questões de 1 a 25
#e o segundo com questões de 26 a 50

library(magrittr) #operador pipe %>%, contatena linhas de comando
library(tidyr) #organização dados

prova %>%
  unite("questões 1a25",c(q1,q2,q3,q4,q5,q6,q7,q8,q9,
                     q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
                     q20,q21,q22,q23,q24,q25),sep = ",") %>%
  unite("questoes 26a50",c(q26,q27,q28,q29,
                     q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
                     q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50),sep = ",")

#---
#5 - ordene a tabela "nota" de acordo com a ordem crescente do numero de acertos
#da questão um
library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados

nota = prova %>%
  arrange(q1)
nota

#---
#6 - quais questões o aluno um acertou?

library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados

  #selecina aluno 1 e remove a coluna aluno
aluno_x = prova %>%
  filter(aluno == "1") %>%
  select(q1,q2,q3,q4,q5,q6,q7,q8,q9,
         q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
         q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
         q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
         q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50)

  #trasforma a tabela larga em uma tabela longa
  #com as colunas "questõas" e "acertos"
aluno_x = aluno_x %>%
  pivot_longer(cols = c(q1,q2,q3,q4,q5,q6,q7,q8,q9,
                        q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
                        q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
                        q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
                        q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50),
               names_to = "questões", values_to = "acertos")

  #filtrar apenas as questões acertadas
aluno_x = aluno_x %>%
  filter(acertos == 1)

  #vetor com as questões acertadas
aluno_x = aluno_x %>% pull(questões)
aluno_x

#---
#7 - quais questões o aluno cinco acertou?

library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados

#selecina aluno 5 e remove a coluna aluno
aluno_x = prova %>%
  filter(aluno == "5") %>%
  select(q1,q2,q3,q4,q5,q6,q7,q8,q9,
         q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
         q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
         q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
         q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50)

#trasforma a tabela larga em uma tabela longa
#com as colunas "questõas" e "acertos"
aluno_x = aluno_x %>%
  pivot_longer(cols = c(q1,q2,q3,q4,q5,q6,q7,q8,q9,
                        q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
                        q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
                        q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
                        q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50),
               names_to = "questões", values_to = "acertos")

#filtrar apenas as questões acertadas
aluno_x = aluno_x %>%
  filter(acertos == 1)

#vetor com as questões acertadas
aluno_x = aluno_x %>% pull(questões)
aluno_x

#---
#8 - quais questões o aluno dez errou?

library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados

#selecina aluno 10 e remove a coluna aluno
aluno_x = prova %>%
  filter(aluno == "10") %>%
  select(q1,q2,q3,q4,q5,q6,q7,q8,q9,
         q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
         q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
         q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
         q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50)

#trasforma a tabela larga em uma tabela longa
#com as colunas "questõas" e "acertos"
aluno_x = aluno_x %>%
  pivot_longer(cols = c(q1,q2,q3,q4,q5,q6,q7,q8,q9,
                        q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
                        q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
                        q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
                        q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50),
               names_to = "questões", values_to = "acertos")

#filtrar apenas as questões erradas
aluno_x = aluno_x %>%
  filter(acertos == 0)

#vetor com as questões acertadas
aluno_x = aluno_x %>% pull(questões)
aluno_x

#---
#9 - quais alunos acertaram a questão cinco?

library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados

#seleciona e filtra os alunos que acertaram a questão 5
alunos_q5a = prova %>%
  select(aluno) %>%
  filter(q5 == 1)

#transforma em vetor a lista dos alunos que acertaram a questão 5
alunos_q5a = alunos_q5a %>%
  pull(aluno)

#mostra o vetor com o numero dos alunos que acertaram a questão 5
alunos_q5a

#---
#10 - quais alunos erraram a questão cinco?

library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados

#seleciona e filtra os alunos que erraram a questão 5
alunos_q5e = prova %>%
  select(aluno) %>%
  filter(q5 == 0)

#transforma em vetor a lista dos alunos que erraram a questão 5
alunos_q5e = alunos_q5e %>%
  pull(aluno)

#mostra o vetor com o numero dos alunos que erraram a questão 5
alunos_q5e

#---
#11 - visualize o numero de acertos de cada questão.

library(tibble) #tipo de data.frame, tabela
library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados

#remover coluna aluno
n_acertos = tibble(prova) %>%
  select(q1,q2,q3,q4,q5,q6,q7,q8,q9,
         q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
         q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
         q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
         q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50)

#pivot_longer q's
n_acertos = n_acertos %>%
  pivot_longer(cols = c(q1,q2,q3,q4,q5,q6,q7,q8,q9,
                        q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
                        q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
                        q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
                        q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50), names_to = "questão" ,values_to = "acertos")

#group_by e summary, somar acertos
n_acertos = n_acertos %>%
  group_by(questão) %>%
  summarise(n_ac_q = sum(acertos))

n_acertos = n_acertos %>%
  arrange(questão)

View(n_acertos)

#---
#12 - visualize o numero de acertos de cada aluno.

#bibliotecas
library(magrittr) #operador pipe %>%, concatena linhas de comando
library(tibble) #tipo de data.frame, "tabela"
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados

#agrupa os dados por aluno e resume os acertos pela soma
ac_aluno = prova %>%
  group_by(aluno) %>%
  summarise(num_acertos = sum(q1,q2,q3,q4,q5,q6,q7,q8,q9,
                              q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
                              q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
                              q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
                              q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50))

#tabela tibble
ac_aluno = tibble(ac_aluno)

ac_aluno

#---
#13 - visualize o numero de acertos por cada aluno na forma de ranking,
#do primeiro colocado ao ultimo.

#bibliotecas
library(magrittr) #operador pipe %>%, concatena linhas de comando
library(tibble) #tipo de data.frame, "tabela"
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados

#agrupa os dados por aluno e resume os acertos pela soma
ac_aluno = prova %>%
  group_by(aluno) %>%
  summarise(num_acertos = sum(q1,q2,q3,q4,q5,q6,q7,q8,q9,
                              q10,q11,q12,q13,q14,q15,q16,q17,q18,q19,
                              q20,q21,q22,q23,q24,q25,q26,q27,q28,q29,
                              q30,q31,q32,q33,q34,q35,q36,q37,q38,q39,
                              q40,q41,q42,q43,q44,q45,q46,q47,q48,q49,q50))

#tabela tibble
ac_aluno = tibble(ac_aluno)

#rankear pelo numero de acertos
ac_aluno = ac_aluno %>%
  arrange(-num_acertos)

ac_aluno

#---
#14 - visualize o ranking das questões de acordo com o numero de acertos,
#no topo do ranking as questões com menos acertos.



#---
#15 - crie uma tabela com três colunas:
#a primeira "aluno"
#a segunda "numero_acetos"
#e a terceira "nota"
#sendo nota = numero_acertos/5

#---
#16 - selecione da tabela "prova" as colunas
#"alunos" e as colunas de "q1" a "q5".
#crie uma nova tabela que una as questões de um a cinco
#cujos valores ficarão separados por espaço em branco.