#Teste de normalidade e Análise gráfica
#Teste de Shapiro-Wilk

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe "%>%", concatena linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(ggplot2) #Elaboração de gráficos
library(DescTools) #Análise descritiva de forma rápida e completa

#Leitura de dados
dados <- read.csv2(file = "~/Programacao/R/Dados/Dados_de_importacao/vendas.csv")
head(dados)
str(dados)
summary(dados)

#Tratamento dos dados
dados$filial <- as.factor(dados$filial)
str(dados)
head(dados)

x <- dados$valor_compra

#Teste de Shapiro-Wilk
shapiro.test(x)

#Análise gráfica - Histogramas
##Pacote básico
hist(x)

##ggplot2
dados %>% 
  ggplot(aes(x))+
  geom_histogram(position = "identity", bins = 5)+
  theme_bw()

#Fechando dispositivo gráfico
dev.off()

#Análise gráfica - qqplot
##qqplot no ggplot2
ggplot(dados, aes(sample = valor_compra))+
  stat_qq()+
  stat_qq_line()+
  theme_bw()

##qqplot com DescTools
PlotQQ(x, args.cband = list(col = SetAlpha("grey", 0.25)))

#Fechando dispositivo gráfico
dev.off()

