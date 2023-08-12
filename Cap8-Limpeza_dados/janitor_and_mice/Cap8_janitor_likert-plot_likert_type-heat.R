#janitor e likert
#Plotagem de escala Likert

#Bibliotecas
library(janitor) #Limpeza de dados
library(ggplot2) #Elaboração de gráficos
library(likert) #Opções de figuras no ggplot para itens com escala likert
library(RColorBrewer) #Pacote com paleta de cores para gráficos

#Criando uma base de dados simulada com 3 questões
niveis <- c("concordo totalmente",
           "concordo parcialmente",
           "neutro",
           "discordo parcialmente",
           "discordo totalmente")

#Cria variáveis com 40 valores semialeatórios de 5 fatores
set.seed(30); q1 = factor(sample(1:5,40,replace = T))
levels(q1) = niveis #Substitui os 5 levels de q1 pelos 5 levels da variável niveis
set.seed(31); q2 = factor(sample(1:5,40,replace = T))
levels(q2) = niveis #Substitui os 5 levels de q2 pelos 5 levels da variável niveis
set.seed(32); q3 = factor(sample(1:5,40,replace = T))
levels(q3) = niveis #Substitui os 5 levels de q3 pelos 5 levels da variável niveis

#As respostas na escala de Likert
respostas <- data.frame(q1,q2,q3)

#Resumo das respostas
tb_likert <- likert(respostas) #Transforma data.frame na classe likert, prepara para plotagem
summary(tb_likert)

#Gráfico das respostas em escala de Likert
plot(tb_likert,
     colors = c("gray30","gray65","gray95","gray75","gray55"), 
     type = "heat")+
  ggtitle("Gráfico das respostas em escala de Likert")+ #Título
  labs(x = NULL,
       y = "Porcentagem de respostas")+ #Rótulos dos eixos
  theme(plot.title = element_text(hjust = 0.5)) #Centraliza o título

#Fechando dispositivo gráfico
dev.off()
