#boxplot (Diagrama de caixa)

#medidas estatisticas para compreensão de aspectos como forma e amplitude dos dados.
#qual o menor e o maior valor observado, os quartis Q1,Q2 e Q3.

#intervalo interquartil: IQR = Q3 - Q1. Ou comprimento da caixa.
#mediana ou Q2, pode estar ligeiramente deslocado do meio, por conta do calculo da mediana.

#outliers, são valores discrepantes das medidas concentradas no meio, possiveis erros de medição.

#cerca inferior(Min): Q1 - 1,5*IQR
#cerca superior(Máx): Q3 + 1,5*IQR
#valores fora da cerca são outliers.

#simetrias, ou para onde tende as outliers.
#Q3 - Q2 > Q2 - Q1, assimetria a direita.
#Q2 - Q1 > Q3 - Q2, assimetria a esquerda.
#Q2 - Q1 = Q3 - Q2, porção central dos dados são simetricos em relação a Q2 (mediana).

#---

#declarando bibliotecas
library(readr) #leitura de dados
library(magrittr) #operador pipe '%>%', concatena linhas de comando
library(tibble) #tipo de data.frame, 'tabela'
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados

#importar dados
turismo <- read.csv(file = "/home/serigo/Documentos/Dados_uff_R/turismo.csv")
View(turismo)

#transformando data.frame em tibble
turismo <- tibble::tibble(turismo)
str(turismo)
class(turismo)

#compreendendo a distribuição de frequencia de chegadas de turistas ao Brasil em 2012
x <- turismo$cheg_2012/1000

boxplot(x,
        main ="Boxplot das chegadas de Turistas ao Brasil em 2012",
        xlab ="Ano de 2012",
        ylab ="Chegadas de turistas em 2012 por mil")

#fechando dispositivo grafico
dev.off()
