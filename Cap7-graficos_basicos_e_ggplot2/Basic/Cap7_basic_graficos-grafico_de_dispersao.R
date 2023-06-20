#grafico de dispersão

#Utilizado para observar a relação entre duas variaveis quantitativas.
#O pesquisador ao plotar esse grafico busca inicialmente uma relação linear.
#A visão do grafico deve ser acompanhada pela medida do "coeficiente de 
#correlação linear", que mede matematicamente a intensidade dessa relação.

#O coeficiente de correlação é uma medida que varia de 1 a -1, espera-se
#valores proximos de 1 ou de -1 no caso de presença de relacionamento linear.

#Esse relacionamento pode ser: 
#crescente (coeficiente positivo) ou
#decrescente (coeficiente negativo)

#---

#declarando bibliotecas
library(readr) #leitura de dados
library(tibble) #tipo de data.frame
library(magrittr) #operador pipe '%>%', concatena linhas de comando
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados

#importando dados a serem trabalhados
turismo <- read_csv("/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
#View(turismo)

#trasformando tabela data.frame em tibble
turismo<- tibble::tibble(turismo)
is_tibble(turismo)

#verificando tipo de dados da tabela
class(turismo)
str(turismo)
turismo

#dados do Rio de Janeiro e São Paulo
dados_RJ <- turismo %>%
  select(Estado,cheg_2014)%>%
  filter(Estado=="RioJaneiro")
dados_RJ

dados_SP <- turismo %>%
  select(Estado,cheg_2014)%>%
  filter(Estado=="SaoPaulo")
dados_SP

#observando a correlação entre as chegadas de São Paulo e Rio de Janeiro
x <- dados_RJ$cheg_2014/1000
y <- dados_SP$cheg_2014/1000
x
y

#Obtendo a correlação
cor(x,y)

#Obtendo os coeficientes da reta de regressão
lm(y ~ x)$coef
#lm = é usado para ajustar modelos lineares. Ele pode ser usado para realizar regressão, análise de variância de estrato único e análise de covariância 
#coef = é uma função genérica que extrai coeficientes de modelo de objetos retornados por funções de modelagem. coeficientes é um apelido para ele.

#grafico de dispersão
plot(x, y, 
     main = paste("Gráfico de Dispersão entre as chegadas de turistas de 2014",
                  "\n","São Paulo x Rio de Janeiro"),
     xlab = "Chegadas no Rio de Janeiro/1000",
     ylab = "Chegadas em São Paulo/1000"
     )
abline(lm(y ~ x), lty = 2, lwd = 2) #adiciona a reta tracejada
#lty = especifica o tipo de linha
#lwd = especifica a espessura da linha
text(130,230,"reta de regressão") #adiciona texto na posição (130,230)
text(130,210,paste("y = ",eval(expression(round(lm(y ~ x)$coef[[2]],2))), #[[j]] seleciona a coluna j
                   "x + ",eval(expression(round(lm(y ~ x)$coef[[1]],2))))) #adiciona equação na posição (130,210)
#paste = Concatenar vetores após a conversão em caractere.
#eval = Avalie uma expressão R em um ambiente especificado.
#expression = Cria ou testa objetos do modo "expressão".

#fechando dispositivo grafico
dev.off()
