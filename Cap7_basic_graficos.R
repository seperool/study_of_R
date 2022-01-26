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
#especifica a cor da borda de uma coluna no grafico

#font =
#controla o estilo da fonte de:
#0 - normal
#1 - italico
#2 - negrito
#3 - italico e negrito

#cex =
#controla o tamanho da fonte do textos, valor padrão é 1
#(cex.axis, cex.lab, cex.main, cex.sub)

#lty =
#especifica o tipo de linha
#1 - solida
#2 - tracejada
# ...

#lwd =
#especifica a espessura da linha (1, 2, ...)

#pch =
#controla o tipo de simbolo (1 a 25 ou especificado entre aspas)

#type =
#especifica o tipo de plotagem:
#'p' (pontos)
#'l' (linhas)
#'b' (pontos conectados por linhas)
#'o' (idem a 'b' com pontos sobrepostos a linha)
#'h' (linhas verticais)
#'s' (degrau no qual o dado é representado no topo da linha vertical)
#'S' (idem ao 's' porem o dado é representado na base da linha vertical)

#xlim = (inicio,fim)
#controla os limites do eixo x

#ylim = (inicio,fim)
#controla os limites do eixo y

#xlab = ""
#adiciona rotulo para o eixo x de acordo com texto entre aspas

#ylab = ""
#adiciona rotulo para o eixo y de acordo com texto entre aspas

#las = ""
#controla a orientação dos rotulos dos eixos:
#0 - paralelo ao eixo
#1 - horizontal
#2 - perpendicular
#3 - vertical

#xaxt ou yaxt = ""
#se xaxt = "n", o eixo x é definido porem não é desenhado,
#se yaxt = "n", o eixo y é definido porem não é desenhado

#text(x, y, 'texto', cex, col)
#adiciona texto ao grafico na coordenada (x,y) 
#podendo ser dimininuido o tamanho da fonte na proporção desejada
#em relação ao tamanho padrão 1
#e com a cor especificada

#legend(x, y, legenda)
#adiciona uma legenda no ponto (x,y)
#com os simbolos dados no campo legenda

#locator (n,type = 'n',...)
#retorna coordenadas correspondentes pedidas pelo usuario ao clickar (n vezes)
#no grafico
#também desenha simbolos (type = 'p') ou linhas (type = '1')
#respeitando os parametros do grafico
#por padrão type = 'n'

#segments(x0,y0, x1, y1,....)
#desenha segmentos de linha a partir do ponto (x0,y0) ate (x1,y1)