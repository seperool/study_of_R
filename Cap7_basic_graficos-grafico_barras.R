#declarando bibliotecas
library(readr)
library(magrittr)
library(dplyr)
library(tibble)

#importando dados
turismo <- read.csv(file = "/home/serigo/Documentos/Dados_uff_R/turismo.csv")
View(turismo)

#transformando data.frame em tibble
turismo <- tibble(turismo)

#partindo dos arquivos de dados
#tabulando o numero de chegada em cada estado

#manipulando dados
#obtendo coluna estados agrupado e a soma das chegadas 2012
tabula_Estados <- turismo %>%
  select(Estado,cheg_2012) %>%
  group_by(Estado) %>%
  summarise(cheg_2012 = sum(cheg_2012))

tabula_Estados #verificando os dados

#grafico barra
#partindo dos dados tabulados
#as categorias devem estar ordenadas
x <- tabula_Estados$Estado[order(tabula_Estados$cheg_2012)]
y <- sort(tabula_Estados$cheg_2012)/1000
x
y

#definindo parametros para a janela grafica
par(mar = c(9, 5, 4, 2), mai = c(1.8, 1, 0.8, 0.4))

barplot(y, names.arg = x,
        main = "Chegada de turistas ao Brasil em 2012",
        cex.main = 1.5, #tamanho do texto
        ylab = "Chegadas por mil",
        cex.names = 1, #tamanho do texto em x
        axisnames = T,
        las = 2 #orientação do texto
        )

#fechando dispositivo grafico
dev.off()

#---

Est <- c("AM", "BA", "CE", "DF", "MS", "MG", "OUTROS", "PA", "PR", "PE",
         "RN", "RS", "RJ", "SC", "SP")
cheg <- c(34720, 142803, 91648, 68540, 43891, 54480, 40749,
          16877, 791396, 70259, 40488, 810670, 1164187, 195708, 2110427)
Est
cheg

#scrip para criar um grafico de barras

#as categorias devem estar ordenadas
x <- Est[order(cheg)] #linka Est a ordem cheg
y <- sort(cheg)/1000 #reordena cheg e divide por mil
x
y

#definindo parametros para a janela grafica

#mar = margens do grafico em relação a margem
#mai = margem em polegada
par(mar = c(5,4,4,2), mai = c(1,0.8,0.8,0.4))

barplot(y, names.arg = x,
        main = "Chegadas de turistas ao Brasil em 2012",
        ylab = "Chegadas por mil",
        xlab = "Estados",
        cex.main = 1.5,
        cex.names = 1,
        axisnames = T, #inclui os nomes das categorias no eixo x
        las = 2)