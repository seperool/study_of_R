#Janitor e tidyverse
##tabyl e adorn_

#Exercicio 8
#Crie uma tabela com a função top_levels e n=2.

#Biblioteca
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(ggplot2) #Elaboração de gráficos
library(RColorBrewer) #Pacote com paleta de cores para gráficos
library(janitor) #Limpeza de dados
library(likert) #Opções de figuras no ggplot para itens com escala likert
library(patchwork) #Layout, juntar ggplot no mesmo gráfico

#data.frame
set.seed(30)
resp = sample(1:5,100,replace = T)
f = as.factor(resp)
levels(f) = c("concordo totalmente",
              "concordo parcialmente",
              "neutro",
              "discordo parcialmente",
              "discordo totalmente")
head(f)
f

#Criando uma tabela com a função top_levels e n=2.
dt = top_levels(f,n=2)
dt

#Visuzalizando Likert
#Gerando data.frame
df <- data.frame(f)

#Preparo para plotagem
tb_f <- likert(df)

#Plotagem 1
p1 <- plot(tb_f,
           colors = c("gray30","gray65","gray95","gray75","gray55"))+
  ggtitle("Gráfico das respostas em escala de Likert")+ #Título
  labs(x = NULL,
       y = "Porcentagem de respostas")+ #Rótulos dos eixos
  theme(plot.title = element_text(hjust = 0.5)) #Centraliza o título
p1

#Plotagem 2
p2 <- plot(tb_f,
           colors = c("gray30","gray65","gray95","gray75","gray55"),
           type = "heat")+
  ggtitle("Gráfico das respostas em escala de Likert")+ #Título
  labs(x = NULL,
       y = "Porcentagem de respostas")+ #Rótulos dos eixos
  theme(plot.title = element_text(hjust = 0.5)) #Centraliza o título
p2

##Layout para 1 linha e 2 colunas
(p1 / p2) + plot_annotation(title = "Visualizações Likert",
                                                  tag_levels = "1") #Título geral e número em cada gráfico

#Fechando dispositivo gráfico
dev.off()
