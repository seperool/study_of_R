#Gráfico de pontos
#geom_point

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
       aes(x = Mes, y = cheg_2013/1000, 
           shape = Estado, #Alterar formas desse grupo de variáveis
           color = Regiao))+ #Diferencia os grupos das variáveis regiao por cor
  scale_x_continuous(limits = c(1,12), #Limites do eixo x
                     breaks = seq(1,12,1))+ #Espaçamento do eixo x
  geom_point(size = 3)+ #Tamanho dos ícones (pontos)
  labs(title = "Gráfico de Dispersão: Mês x chegadas em 2013",
       x = "Meses",
       y = "Chegadas por mil")+
  theme_bw(base_size = 18)+ #Adiciona tema "black and white" e tamanho da fonte
  theme(plot.title = element_text(hjust = 0.5))+ #Título centralizado
  scale_color_grey(start = 0.8, end = 0.2) #Aplica escalas de cinza

#Fechando dispositivo gráfico
dev.off()
