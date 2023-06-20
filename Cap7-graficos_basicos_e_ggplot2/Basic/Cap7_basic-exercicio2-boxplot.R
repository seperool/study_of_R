#boxplot (diagrama de caixa)

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
#incluindo bibliotecas
library(readr) #leitura de dados
library(tibble) #estruturação de data.frame
library(magrittr) #operador pipe '%>%', concatena linhas de comando
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados
library(data.table) #manipulação de base data.frame

#importar dados
turismo <- read_csv(file = "/home/serigo/Documentos/Dados_uff_R/turismo.csv")
View(turismo)

#transformação de data.frame em tibble
turismo <- tibble(turismo)
class(turismo)
str(turismo)

#plot
boxplot(turismo$cheg_2014/1000,
        col = "darkblue", #colorir diversos itens do grafico
        main = "Boxplot - Diagrama de caixa", #titulo
        xlab = "Numero de chegadas", #rotulo do eixo x
        sub = "Fonte: elaboração propria") #legenda

#fechando dispositivo grafico
dev.off()
