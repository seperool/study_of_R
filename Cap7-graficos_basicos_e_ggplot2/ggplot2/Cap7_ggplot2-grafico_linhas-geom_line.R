#Gráfico de linhas
#geom_point + geom_line

#O gráfico de linhas temos dois eixos numéricos.
#Produz um gráfico em que cada ponto dele é unido por uma linha.
#É um gráfico adequado para representar séries de valores no tempo.

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe %>%, concatena linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(tibble) #Estrutura de data.frame
library(ggplot2) #Elaboração de gráficos
library(grid) #Adiciona funções gráficas ao sistema ggplot2 e é um pacote gráfico também
library(patchwork) #Layout, junta ggplot no mesmo gráfico

#Importação de dados
dados <- read.csv(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
dados <- tibble(dados)
View(dados)

#Plotagem
ggplot(subset(dados, Regiao %in% c("Sul", "Sudeste")), #Subconjunto de dados de um data.frame
       #O comando filtra dos dados do data.frame
       aes(x = Mes,
           y = cheg_2013/1000, 
           shape = Estado, #Alterar formas desse grupo de variáveis
           color = Regiao))+ #Diferencia os grupos das variáveis regiao por cor
  scale_x_continuous(limits = c(1,12), #Limites do eixo x
                     breaks = seq(1,12,1))+ #Espaçamento do eixo x
  geom_point(size = 3)+ #Tamanho dos ícones (pontos)
  geom_line(size = 1.0)+ #Espessura da linha
  labs(title = "Gráfico de Linhas: Mês x chegadas em 2013",
       x = "Meses",
       y = "Chegadas por mil")+
  theme_bw(base_size = 18)+ #Adiciona tema "black and white" e tamanho da fonte
  scale_color_grey() #Aplica escalas de cinza

#Fechando dispositivo gráfico
dev.off()
