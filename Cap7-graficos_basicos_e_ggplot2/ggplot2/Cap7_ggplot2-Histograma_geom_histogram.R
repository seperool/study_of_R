#Histograma com ggplot2
#geom_histogram

#Biblioteca
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

#Plotagem
p = ggplot(dados,aes(x=cheg_2013/1000))

#Adição de camadas
p+
  geom_histogram(aes(y= ..count.., fill=factor(Regiao)),
                 position = "identity", alpha = 0.6,binwidth = 0.1)+
  scale_x_log10()+
  labs(x = "Chegadas em escala logarítmica",
       y = "Frequência Absoluta",
       title = "Histograma do número de chegadas de turistas ao Brasil \nAno de 2013")+
  theme_bw(base_size = 18)+
  scale_fill_discrete(name = "Região")+
  scale_fill_grey(start = 0.2,end = 0.8)

#Fechando dispositivo gráfico
dev.off()
