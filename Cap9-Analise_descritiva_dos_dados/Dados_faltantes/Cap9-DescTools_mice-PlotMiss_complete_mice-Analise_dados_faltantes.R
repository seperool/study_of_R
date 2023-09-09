#Dados faltantes
#PlotMiss() + complete(mice())

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe " %>% ", concatenação de linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(mice) #Substituir valores perdidos
library(DescTools) #Análise descritiva de forma rápida e completa

#Importação de dados
dados <- read_csv2(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/vendas_NA.csv")
head(dados)
View(dados)

#Análise de distribuição de dados faltantes
PlotMiss(dados, col = colorRampPalette(c("gray10","gray90"))(1))
#n_itens apresenta maior ausência de dados, 8 (22,2%).

#Fechando dispositivo gráfico
dev.off()
#-------------------------------------------------------------------------------
#Completar dados faltantes (técnica de imputação de dados)
#Analisando e preparando os dados
str(dados)
dados$filial <- as.factor(dados$filial) #Mudando chr para factor para preparar os dados para complete-mice
str(dados)
summary(dados)

#complete(mice())
dados_ajustados <- complete(mice(dados, printFlag = F))
summary(dados_ajustados)

#Análise descritiva
Desc(dados_ajustados$n_itens, digits = 2)

#Análise de distribuição de dados faltantes
PlotMiss(dados_ajustados, col = colorRampPalette(c("gray10","gray90"))(1))
#substituiu os dados faltantes a maioria dos dados faltantes.

#Fechando dispositivo gráfico
dev.off()
