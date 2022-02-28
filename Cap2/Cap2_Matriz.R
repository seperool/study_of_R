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

#criamos o vetor Tipo com as referencias das linhas
Tipo = c("Prova A", "Prova B", "Prova C")
Tipo

#acrescentamos o valor Tipo ao objeto notas
notas = data.frame(Nota.aluno1,Nota.aluno2, Tipo)
notas

#cria uma matriz por colunas
Mc = cbind(Nota.aluno1, Nota.aluno2)
Mc

#cria uma matriz por linhas
Ml = rbind(Nota.aluno1,Nota.aluno2)
Ml

#criando uma matriz por colunas misturando vetor numerico com caractere
M = cbind(Nota.aluno1,Nota.aluno2,Tipo)
M

#analisando a estrutura do objeto M
str(M)

#obs.: note que por conta do vetor Tipo ser str, a matriz passou a ser toda str

#acessando valores de posições específicas dos objetos
#nota do aluno 1 na posição 2 do vetor
Nota.aluno1 [2]

#valor armazenado na posição 2 do objeto Tipo
Tipo [2]

#valor da linha 1 e coluna 2 na matriz Mc
Mc [1,2]

#valor da linha 2 e coluna 3 na matriz Ml
Ml [2,3]

#todos os valores da coluna 2 no data.frame notas´
notas [,2]

#todos os valores da linha 2 no data.frame notas´
notas [2,]

#valores do vetor Nota.aluno2 contido no objeto notas
notas$Nota.aluno2

View(notas)
