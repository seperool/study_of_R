#janitor - Teste qui-quadrado - Hipótese H_0

#Hipóteses:
##H_0
##A variável linha é independente da variável coluna, ou seja, 
##a proporção no total das linhas deve ser a mesma quando considerada
##em cada categoria da variável linha.

##H_1
##A variável linha é dependente da variável coluna, ou seja,
##a proporção no total das linhas é diferente da proporção
##em cada categoria da variável linha.

#Testes:
##o nível de significância (alpha) adotado na pesquisa, 
##que em geral costuma ser de 0,05(ou seja, 5%).

##Se p-valor > 0,05 = H_0
##Não é possível rejeitar a hipótese nula (H_0).
##Concluímos que as variáveis não são dependentes, são independentes,
##ao nível de significância de 5%.

##Se p-valor <= 0,05 = H_1
##Rejeitamos a hipótese conhecida como nula (H_0).
##Concluímos que as variáveis são dependentes ao nível de significância de 5%.

#Bibliotecas
library(magrittr) #Operador pipe "%>%", concatena linhas de comando
library(janitor) #Limpeza de dados

#Suponha dois grupos que receberam tratamento
grupo <- c(rep("A",15),rep("B",15))
set.seed(20)
resposta <- c(sample(0:1,25,replace = T),rep(1,5))
dt = data.frame(grupo,resposta)

tab = tabyl(dt, grupo, resposta, show_na= F)
tab

#Aplicando o teste qui-quadrado
chisq.test(tab)

#Conclusão
##p-value = 0.4652
##Logo, p-value > alpha
##Assim, não podemos rejeitar a hipótese nula (H_0),
##Não há evidências suficientes para concluir que as variáveis estão associadas.
##É a hipótese H_0.