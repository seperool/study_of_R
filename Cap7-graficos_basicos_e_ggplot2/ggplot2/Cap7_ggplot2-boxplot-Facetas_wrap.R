#Boxplot com ggplot2 + facetas
#geom_boxplot + facet_wrap

#Para elaborar um boxplot é necessário pelo menos uma variável quantitativa.
#Se a variável pode ser agrupada por fatores(factor), temos um boxplot comparativo y ~ x
#Isto é, a variável númerica y agrupada pelas categorias da variável do tipo fator x.

#Bibliotecas
library(ggplot2) #Elaboração de gráficos
library(magrittr) #Operador pipe %>%, concatena linhas de comando
library(readr) #Leitura de dados
library(grid) #Adiciona funções gráficas ao sistema ggplot2 e é um pacote gráfico também
library(patchwork) #Layout, juntar ggplot no mesmo gráfico 
library(dplyr) #Manipulação de dados
library(tibble) #Estruturação de data.frame
library(tidyr) #Organização de dados

#Importação de dados
dados <- read.csv(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
dados <- tibble(dados)
View(dados)

#Organizando dados
dt = dados %>% 
  filter(Regiao != "Variados")

#Plotagem
p <- dt %>% 
  ggplot(aes(x=as.factor(Mes),y=cheg_2012/1000))

#Adição de camadas
p +
  geom_boxplot() +
  labs(title = "Chegada de turistas ao Brasil em 2012 por Regiões",
       x= "Mês",
       y="Número de chegadas") +
  theme_bw(base_size = 18)+ #Adiciona tema "black and white"
  facet_wrap(~Regiao, scale = "free_y", nrow=2)

#Fechando dispositivo gráfico
dev.off()
