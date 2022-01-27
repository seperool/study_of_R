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