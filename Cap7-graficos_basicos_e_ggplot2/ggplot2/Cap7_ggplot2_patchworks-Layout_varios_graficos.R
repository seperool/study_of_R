#Layout com vários gráficos usando pacote patchworks

#Bibliotecas
library(magrittr) #Operador pipe %>%, concatena linhas de comando
library(readr) #Leitura de dados
library(ggplot2) #Elaboração de gráficos
library(patchwork) #Adiciona funções gráficas ao sistema ggplot2

#Lendo dados
dados <- read.csv(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
#View(dados)

#ggplot
p = ggplot(data = dados, aes(x = cheg_2012/1000,y = cheg_2013/1000))

#Gráfico 1
g1 <- p+
  geom_blank()+
  theme_bw(base_size = 18)

#Gráfico 2
g2 <- p+
  geom_point()+
  theme_minimal(base_size = 18)

#Layout para 1 linha e 2 colunas (g1 ao lado de g2)
g1 + g2 + plot_layout(ncol = 2) + plot_annotation(title = "Dois gráficos com patchwork",
                                                  tag_levels = "1") #Título geral e número em cada gráfico

#fechando dispositivo grafico
dev.off()
