#Grafico de linhas

#utilizado para visualizar duas ou mais variaveis numericas
#que podem ser plotadas em função do tempo no eixo x

#---

#Comparar series 

#utilizando a divisão da janela grafica em duas partes atraves do comando
#par(mfrow) ou layout(matriz(figura1, figura2),linha,coluna)

#---

#declarando bibliotecas
library(readr) #leitura de dados
library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados
library(tibble) #tipo de data.frame, "tabela"
library(data.table)

#banco de dados a ser trabalhado
dados <- read.csv(file = "/home/serigo/Documentos/Dados_uff_R/turismo.csv")
#View(dados) #vizualizando dados

#transformando tabela data.frame em tibble para trabalhar
dados <- tibble(dados)

#verificando tipo da tabela
str(dados) #estrutura
class(dados) #classe da tabela
dados #visuaçização dos dados

#---
#dados do primeiro grafico

#manipulando dados para extrair
#são paulo, ao longo dos meses, considerando cada ano observado de 2012 a 2015
#organizando os dados do Estado de São paulo em função dos meses
dados_SP <- dados %>%
  select(Mes, Estado, cheg_2012, cheg_2013, cheg_2014, cheg_2015) %>%
  filter(Estado == "SaoPaulo")
dados_SP

#definindo os valores dos eixos
x1 <- dados_SP$Mes
y1 <- dados_SP$cheg_2012/1000
y2 <- dados_SP$cheg_2013/1000
y3 <- dados_SP$cheg_2014/1000
y4 <- dados_SP$cheg_2015/1000

#visualizando valores dos eixos
x1
y1
y2
y3
y4

#dados do segundo grafico

#organizando os dados do Rio de janeiro em função dos meses
dados_RJ <- dados[dados$Estado == "RioJaneiro",]
dados_RJ

#definindo os valores dos eixos
x2 <- dados_RJ$Mes
z1 <- dados_RJ$cheg_2012/1000
z2 <- dados_RJ$cheg_2013/1000
z3 <- dados_RJ$cheg_2014/1000
z4 <- dados_RJ$cheg_2015/1000

#visualizando valores dos eixos
x2
z1
z2
z3
z4

#script para dois graficos de linha
#preparando a janela grafica para receber dois graficos
#par(mfrow = c(2,1)) #necessidade de configurar margens
#par(mar = c(6,4,1,1), mai = c(0.9,0.9,0.3,0.1)) 
layout(matrix(c(1,2), 1, 2)) #tende a funcionar melhor que mfrow
#numero de linhas, numero de colunas

#grafico 1

#definindo os limites do eixo y
li1 <- min(y1,y2,y3,y4)
ls1 <- max(y1,y2,y3,y4)

#script para o grafico de linha
plot(x1, y1, lty = 1, lwd = 1, type = "b", ylim = c(0.8*li1,ls1*1.2),xlab ="",
     ylab = "") #xlab e ylab vazios some com os rotulos x e y, para que possa colocar a no titulo (title) abaixo
lines(x1, y2, lty = 2, lwd = 1, type = "b") #acrescenta y2
lines(x1, y3, lty = 3, lwd = 2, type = "b") #acrescenta y3
lines(x1, y4, lty = 4, lwd = 1, type = "b") #acrescenta y4
#lty = especifica o tipo de linha
#lwd = especifica a espessura da linha
#type = especifica o tipo de plotagem, 'b' (pontos conectados por linhas)
title(main = "Chegada de turistas em São Paulo",
      xlab ="Mês",
      ylab = "Chegadas por mil")
legend(9,400,c("2012","2013","2014","2015"), lty = 1:4, cex = 0.5) #os dois primeiros valores são a posição (coordenadas) da legenda no grafico

#grafico 2

#definindo os limites do eixo y
li2 <- min(z1,z2,z3,z4)
ls2 <- max(z1,z2,z3,z4)

#script para o grafico de linha
plot(x2, z1, lty = 1, lwd = 1, type = "b", ylim = c(0.8*li2,ls2*1.2), xlab ="",
         ylab = "") #xlab e ylab vazios some com os rotulos x e y, para que possa colocar a no titulo (title) abaixo
lines(x2, z2, lty = 2, lwd = 1, type = "b") #acrescenta y2
lines(x2, z3, lty = 3, lwd = 2, type = "b") #acrescenta y3
lines(x2, z4, lty = 4, lwd = 1, type = "b") #acrescenta y4
#lty = especifica o tipo de linha
#lwd = especifica a espessura da linha
#type = especifica o tipo de plotagem, 'b' (pontos conectados por linhas)
title(main = "Chegada de turistas em Rio de Janeiro",
      xlab ="Mês",
      ylab = "Chegadas por mil",
      sub = "Fonte: Elaborado com pacote graphics version 3.6.1 do R.", cex.sub = 0.8)
legend(9,300,c("2012","2013","2014","2015"), lty = 1:4, cex = 0.5) #os dois primeiros valores são a posição (coordenadas) da legenda no grafico

#fechando dispositivo grafico
dev.off()
