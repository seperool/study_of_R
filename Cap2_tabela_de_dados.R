#nota de 3 avaliações do aluno 1
#armazena no objeto Nota.aluno1
Nota.aluno1 = c(8, 8.6, 8.8)

#nota de 3 avaliações do aluno 2
#armazena no objeto Nota.aluno2
Nota.aluno2 = c(7.3, 6.7, 7)

#consulta o conteudo do objeto Nota.aluno1
Nota.aluno1

#consulta o conteudo do objeto Nota.aluno2
Nota.aluno2

#criamos uma tabela de nome notas contendo

#as notas dos dois alunos em cada coluna
notas = data.frame(Nota.aluno1, Nota.aluno2)

#consultando o conteúdo do objeto
notas

View(notas)

#criamos o vetor Tipo com as referencias das linhas
Tipo = c("Prova A", "Prova B", "Prova C")

#acrescentamos o valor Tipo ao objeto notas
notas = data.frame(notas, Tipo)
notas
View(notas)
