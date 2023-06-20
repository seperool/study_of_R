#Grafico de linhas com cores

#olhar linhas 57 a 70

#utilizado para visualizar duas ou mais variaveis numericas
#que podem ser plotadas em função do tempo no eixo x

#---

#declarando bibliotecas
library(readr) #leitura de dados
library(magrittr) #operador pipe %>%, concatena linhas de comando
library(dplyr) #manipulação de dados
library(tibble) #tipo de data.frame, "tabela"

#banco de dados a ser trabalhado
dados <- read.csv(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
View(dados) #vizualizando dados

#transformando tabela data.frame em tibble para trabalhar
dados <- tibble(dados)

#verificando tipo da tabela
str(dados) #estrutura
class(dados) #classe da tabela
dados #visuaçização dos dados

#manipulando dados para extrair
#são paulo, ao longo dos meses, considerando cada ano observado de 2012 a 2015
#organizando os dados do Estado de São paulo em função dos meses
dados_SP <- dados %>%
  select(Mes, Estado, cheg_2012, cheg_2013, cheg_2014, cheg_2015) %>%
  filter(Estado == "SaoPaulo")
dados_SP

#definindo os valores dos eixos
x <- dados_SP$Mes
y1 <- dados_SP$cheg_2012/1000
y2 <- dados_SP$cheg_2013/1000
y3 <- dados_SP$cheg_2014/1000
y4 <- dados_SP$cheg_2015/1000

#visualizando valores dos eixos
x
y1
y2
y3
y4

#definindo os limites do eixo y
li <- min(y1,y2,y3,y4)
ls <- max(y1,y2,y3,y4)
li
ls

#script para o grafico de linha
plot(x, y1, lty = 1, lwd = 1, type = "b", ylim = c(0.8*li,ls*1.2),xlab ="",
     ylab = "", col = "red") #xlab e ylab vazios some com os rotulos x e y, para que possa colocar a no titulo (title) abaixo
lines(x, y2, lty = 2, lwd = 1, type = "b", col = "yellow") #acrescenta y2
lines(x, y3, lty = 3, lwd = 2, type = "b", col = "blue") #acrescenta y3
lines(x, y4, lty = 4, lwd = 1, type = "b", col = "green") #acrescenta y4
#lty = especifica o tipo de linha
#lwd = especifica a espessura da linha
#type = especifica o tipo de plotagem, 'b' (pontos conectados por linhas)
title(main = "Chegada de turistas em São Paulo",
      xlab ="Mês",
      ylab = "Chegadas por mil",
      sub = "Fonte: Elaborado com pacote graphics version 3.6.1 do R.",
      cex.sub = 0.8)
legend(9,400,c("2012","2013","2014","2015"), col = c("red","yellow","blue","green"),lty = 1:4, cex = 0.5) #os dois primeiros valores são a posição (coordenadas) da legenda no grafico

#fechando dispositivo grafico
dev.off()
