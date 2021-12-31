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

#4 - 