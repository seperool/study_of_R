#Ajustando parâmetros de texto de um ggplot2

#declaração de bibliotecas
library(readr) #leitura de dados
library(tibble) #estruturação de data.frame
library(magrittr) #operador pipe '%>%', concatena linhas de comando
library(dplyr) #manipulação de dados
library(tidyr) #organização de dados
library(data.table) #manipulação de base de dados data.frame
library(ggplot2) #elaboração de gráficos

#importar dados
dados <- read.csv(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
View(dados)

#transformação de data.frame em tibble
dados <- tibble::tibble(dados)
class(dados)
str(dados)

#Plot
p = ggplot(data = dados, aes(x = cheg_2012/1000, y = cheg_2013/1000))

#ajustando parâmetros de texto
p+
  geom_blank()+
  labs(title = "Título",
       x = "Eixo x",
       y = "Eixo y",
       subtitle = "Subtítulo")+
  theme_bw(base_size = 18)+
  theme(text = element_text(family = "mono"))+ #Altera a fonte de todos os textos
  theme(axis.text.x = element_text(size = rel(1.2)))+ #Aumenta a fonte só do eixo x em 20%
  theme(axis.text.y = element_text(angle = 45))+ #Muda o angulo do texto do eixo y em 45 graus
  theme(axis.title.y = element_text(face = "bold.italic"))+ #Muda o rótulo do eixo y para negrito-itálico
  theme(plot.title = element_text(hjust = 0.5))+ #Centraliza o título
  theme(plot.subtitle = element_text(hjust = 1)) #Subtítulo a direita

#fechando dispositivo grafico
dev.off()
