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

#5 - ordene a tabela "nota" de acordo com a ordem crescente do numero de acertos
#da questão um
library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados

nota = prova %>%
  arrange(q1)
nota

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

#9 - quais alunos acertaram a questão cinco?
#10 - quais alunos erraram a questão cinco?