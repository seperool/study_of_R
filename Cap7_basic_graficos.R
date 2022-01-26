#declarando biblioteca
library(ggplot2) #elaboração de graficos
library(readr) #leitura de dados
library(tibble) #tipo de data.frame, "tabela"

#importação de dados
turismo <- read_csv("Documentos/Dados_uff_R/turismo.csv")
View(turismo) #visualizando dados, testando para ver se o read_csv deu certo

#transformando data.frame em tibble
turismo <- tibble::tibble(turismo)
View(turismo) #visualizando tibble
class(turismo) #confirmando tipo
turismo

#---
#graficos com o pacote basico
#definnições:

#FUNÇÕES

#barplot(x)
#produz um grafico de colunas do vetor x

#boxplot(x)
#produz boxplot de x, distribuição de dados de varios grupos

#coplot(y~x|z)
#produz um grafico de dispersão entre x e y
#condicionado a z

#curve(expressão)
#produz um grafico a partir da expressão de certa função de x

#dotplot(x)
#produz um grafico de pontos

#hist(x)
#produz histograma do vetor x

#mosiacplot
#produz um mosaico para tabelas de contigencia

#pairs(x)
#produz um grande grafico de dispersão
#entre variaveis quantitativas de uma tabela

#pie(x)
#produz grafico circular (pizza)

#plot(x)
#produz grafico de dispersão entre x e y

#qqnorm(x)
#plota os quantis de x usando como base a curva normal

#stem(x)
#produz um ramo e folhas

#stripchart
#produz um grafico de dispersão unidimensional

#---
#ARGUMENTOS PARA ADICIONAR EFEITOS EM GRAFICOS

#adj =
#controla a formatação do texto
#0 - formatação a esquerda
#0.5 - centralizada
#1 - a direita

#main = ""
#adiciona o titulo principal ao grafico de acordo com o texto entre aspas

#col = 
#comando para colorir diversos itens do grafico
#pode ser valores como 1, 2, ... ou por nome como "red", "blue", ...
#(consulte nomes com o comando colors() ou sistemas como rgb(), hsv(), gray()
#e rainbow())
#para cor das fontes use: col.axis, col.lab, col.main, col.sub

#border =

#font =

#cex =

#lty =

#lwd =

#pch =

#type =

#xlim = (inicio,fim)
#controla os limites do eixo x

#ylim = (inicio,fim)
#controla os limites do eixo y

#xlab = ""

#ylab = ""

#las = ""

#xaxt ou yaxt = ""

#text(x, y, 'texto', cex, col)

#legend(x, y, legenda)

#locator (n,type = 'n',...)

#segments(x0,y0, x1, y1,....)
#desenha segmentos de linha a partir do ponto (x0,y0) ate (x1,y1)