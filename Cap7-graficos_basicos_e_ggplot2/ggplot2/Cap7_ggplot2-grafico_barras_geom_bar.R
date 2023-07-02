# Gráfico de barras com ggplot2
#geom_bar

#Bibliotecas
library(ggplot2) #Elaboração de gráficos
library(magrittr) #Operador pipe %>%, concatena linhas de comando
library(readr) #Leitura de dados
library(patchwork) #Layout, juntar ggplot no mesmo gráfico 
library(dplyr) #Manipulação de dados
library(tibble) #Estruturação de data.frame
library(tidyr) #Organização de dados

#Importando dados
dados <- read.csv(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
dados <- tibble(dados)
View(dados)

#Preparação dos dados
dt <-dados %>% 
  group_by(Estado) %>% 
  summarise(y = sum(cheg_2013/1000)) %>% 
  arrange(y)
View(dt)

#Plotando gráfico de barras (geom_bar)
p <- ggplot(data = dt, aes(x = reorder(Estado,y), y))+ #Mapeamento das variáveis
  geom_bar(stat = "identity")+ #Forma de barras
  labs(title = "Chegada de Turistas ao Brasil em 2013", #Título
       x = "Estados", #Texto do eixo x
       y = "Número de chegadas por mil")+ #Texto do eixo y
  geom_text(aes(label = round(y,2)), hjust=0.5, vjust=0)+ #Insere valores sobre as barras
  theme_bw(base_size = 18)+ #Define o tema
  theme(plot.title = element_text(hjust = 0.5))+ #Centraliza o texto do título
  theme(axis.text.x = element_text(angle = 90)) #Muda o ângulo do texto do eixo x em 90 graus
p

#Fechando dispositivo gráfico
dev.off()
