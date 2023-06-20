#grafico circular (pizza)

#Utilize-o somente em caso de a variavel possuir poucas categorias 
#(em torno de 5)
#com quantidas diferentes entre si

#caso contrario o analista deve optar pelo grafico de barras

#---

#declaração de bibliotecas
library(dplyr) #manipulação de dados
library(magrittr) #operador pipe, concatena linhas de comando
library(tibble) #tipo de data.frame, "tabela"
library(tidyr) #organização de dados
library(readr) #leitura de dados

#banco de dados a ser trabalhado
dados <- read.csv(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")

#transformando data.frame em tibble para melhor trabalhar
dados <- tibble(dados)

#confirmando tipo de dados e a tabela
class(dados)
str(dados)
dados #visualizar tabela

#manipulação de dados, extraindo estado e chegadas em 2012
tabula_Estado <- dados %>%
  select(Estado, cheg_2012) %>%
  group_by(Estado) %>%
  summarise(cheg_2012 = sum(cheg_2012))
tabula_Estado

#as categorias devem estar ordenadas
x <- tabula_Estado$Estado[order(tabula_Estado$cheg_2012)]
y <- sort(tabula_Estado$cheg_2012)/1000
x
y

#observe a proporção por categoria
y/sum(y)
x

#procure juntar categorias com baixa proporção na categoria "outros".
#aqui juntamos as 10 primeiras categorias de menor proporção
y <- c(sum(y[1:10]), y[11:15])
x <- c("Outros", as.character(x[11:15]))

#script para o grafico circular
porc <- 100*round(y/sum(y), 2) #calcula porcentagem %
rotulos <- paste(x, "(",porc,"%)", sep = "") #texto para os rotulos
par( mar = c(2,0,1,0), mai = c(0.4,0,0.2,0)) #margens
pie(y,
    main = "Proporção de chegadas de turistas por Estado em 2012",
    labels = rotulos, #rotulos de cada parte do grafico
    cex.main = 1.5, #tamanho do titulo
    cex = 1, #tamanho do texto dos rotulos
    col = gray(1:length(x)/length(x)) #cores do grafico
    )
text(0,-1, "Fonte: Elaborado com pacote graphics version 3.6.1 do R.", cex = 1) #texto ao final do grafico

#fechando dispositivo grafico
dev.off()
