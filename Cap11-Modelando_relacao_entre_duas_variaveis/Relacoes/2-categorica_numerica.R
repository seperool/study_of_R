#Relações entre duas variáveis
#Categórica (resposta) ~ numérica (explicação) (Y~X)

#O desconto na compra fornece resposta quanto ao local de compra? 

#Resposta (Y): local de compra, filial.
#Explicação (X): Percentual de desconto no valor da compra.
#Nível de significância: 0.05

#Hipóteses:
#H0: não há relação entre local de compra e desconto na compra.
#H1: há relação entre local de compra e desconto na compra.

#Bibliotecas
library(knitr) #Interpretação e compilação do documento rmd, formato tabela kable
library(readr) #Leitura de dados
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(dplyr) #Manipulação dados
library(tidyr) #Organização de dados
library(ggplot2) #Elaboração de gráficos
library(patchwork) #Layout, juntar ggplot no mesmo gráfico
library(mice) #Substitui valores perdidos
library(janitor) #Limpeza de dados
library(DescTools) #Análise descritiva de forma rápida e completa
library(lubridate) #Transformar e extrair datas, funções para trabalhar com datas
library(nnet) #Modelos de regressão logística

#Importando dados
dados <- read.csv2(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/vendas.csv")
head(dados)
str(dados)

#Tratando os dados
dados$filial <- as.factor(dados$filial) #Transformando dados filial em tipo fator
dados$quinzena <- as.factor(dados$quinzena) #Transformando dados quinzena em tipo fator
str(dados)

#Definindo a variável de referência como filial A.
dados$filial_f <- relevel(dados$filial, ref = "A")
head(dados)
str(dados)

#Modelagem
#(Y(resposta/categória) ~ X(explicação/numérica))
modelo <- multinom(filial_f ~ desconto_perc, dados)

summary(modelo)
#Coefficients:
#  (Intercept) desconto_perc
#B   0.2705908     0.1181947
#C  -0.6251925     0.1221450

#Logo,
#Logaritmo da razão de chance e x são os valores para a variável desconto_perc:
##y1(x) = ln(P(B)/P(A)) = 0.27+0.118x
##y2(x) = ln(P(C)/P(A)) = -0.63+0.122x

#Razão da chance fornecida pelo modelo
#Função inversa ao logaritmo, ou seja, exponencial.
exp(coef(modelo))
#   (Intercept) desconto_perc
#B   1.3107386      1.125463
#C   0.5351584      1.129918

#Logo,
#A razão de chance fornecida pelo modelo é:
#P(B)/P(A) = 1.31+1.126^x
#P(C)/P(A)) = 0.54+1.130^x

#Exemplo
#Para um desconto de 0 (x=0), P(B)/P(A) = 2.31, ou seja,
#a filial B tem 2.31 vezes mais chance de não obter (0%) desconto que a filial A. 

#Prevendo a probabilidade de cada filial face aos descontos
valor <- data.frame(desconto_perc = seq(0,20,5))
p <- predict(modelo,newdata = valor,type = "prob")
tabela <- data.frame(valor,p)
tabela
#  desconto_perc          A         B         C
#1             0 0.35138307 0.4605713 0.1880456
#2             5 0.22975316 0.5437937 0.2264532
#3            10 0.14105843 0.6028764 0.2560651
#4            15 0.08291156 0.6398835 0.2772050
#5            20 0.04740715 0.6606725 0.2919203

#Logo,
#Chance muito baixa de conseguir um desconto de 15% ou 20% na filial A (aproximadamente 8% e 4%)
#Chance alta de conseguir descontos de 5 a 20% na filial B (aproximadamente 54, 60, 63 e 66%)

#-------------------------------------------------------------------------------
#Avaliando a significancia dos parâmetros
#Padronizando os coeficientes do modelo
z <- summary(modelo)$coefficients / summary(modelo)$standard.errors
z
#   (Intercept) desconto_perc
#B   0.4383698     1.0278743
#C  -0.8025002     0.9329645

#Obtendo o p-valor dos parâmetros
pval <- (1 - pnorm(abs(z),0,1))*2
pval
#   (Intercept) desconto_perc
#B   0.6611183     0.3040089
#C   0.4222637     0.3508383

#Logo,
#Em todos os parâmetros como p-valor > 0.05,
#os coeficientes estimados são significantes.
#-------------------------------------------------------------------------------
#Avaliando a acurácia do modelo

#Acurácia é a proporção de predições corretas do modelo.
#Gerar uma matriz de confusão do modelo de análise.
#Acurácia = total de acertos / total de dados

mc <- table(dados$filial_f, predict(modelo)) #Gerar a matriz de confusão
kable(mc) #Apresentação da tabela em formato kable

#  |   |  A|  B|  C|
#  |:--|--:|--:|--:|
#  |A  |  0|  6|  0|
#  |B  |  0| 12|  0|
#  |C  |  0|  5|  0|

#Classificou 6 vezes filial A como B (erro)
#Classificou 12 vezes filial B como B (acerto)
#Classificou 5 vezes filial C como B (erro)

#Cálculo da acurácia
sum(diag(mc))/sum(mc) #Diagonal da matriz de confusão são as previsões corretas.
#[1] 0.5217391
#Acurácia = 52%
#Prever erroneamente  = 48%
#Esse modelo possui baixa acurácia.