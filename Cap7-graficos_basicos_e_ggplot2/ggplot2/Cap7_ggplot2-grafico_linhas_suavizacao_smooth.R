#Gráfico de linhas com efeito de suavização smooth
#geom_point + geom_smooth

#O gráfico de linhas com ajuste de curva entre dois eixos numéricos.
#Usa o modelo de regressão local para gerar uma curva suavizada que melhor se ajuste aos pontos.
#Na regressão local estima-se um função na vizinhança de cada ponto de interesse.
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
ggplot(subset(dados, Estado %in% c("SaoPaulo")), #Subconjunto de dados de um data.frame
       #O comando filtra dos dados do data.frame
       aes(x = cheg_2012/1000,
           y = cheg_2013/1000, 
           color = Estado))+ #Diferencia os grupos das variáveis regiao por cor
  scale_x_continuous(limits = c(140,230), #Limites do eixo x
                     breaks = seq(140,230,10))+ #Espaçamento do eixo x
  geom_point(size = 1.5)+ #Tamanho dos ícones (pontos)
  geom_smooth(size = 1.0, span = 0.3)+ #Espessura da curva
  labs(title = "Gráfico com ajuste de curva de tendência: 2012 x 2013",
       x = "Chegadas por mil em 2012",
       y = "Chegadas por mil em 2013")+
  theme_bw(base_size = 18)+ #Adiciona tema "black and white" e tamanho da fonte
  scale_color_grey() #Aplica escalas de cinza

#Fechando dispositivo gráfico
dev.off()
