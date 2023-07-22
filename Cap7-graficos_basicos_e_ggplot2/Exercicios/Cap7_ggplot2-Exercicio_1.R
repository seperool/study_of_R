#Exercicio [1]

#Extraia os dados de São Paulo, Rio de Janeiro e Rio Grande do Sul e
#apresente um gráfico de barras lado a lado, comparando o total de chegadas
#do ano de 2014 a 2015.

#Bibliteca
library(readr) #Leitura de dados
library(tibble) #Estruturação de data.frame
library(magrittr) #Operador pipe %>%, concatena linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(ggplot2) #Elaboração de gráficos
library(grid) #Adicionar funções gráficas ao sistema ggplot2 e é um pacote gráfico também
library(patchwork) #Layout, juntar ggplot no mesmo gráfico

#Importação de dados
dados <- read.csv(file = "~/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
View(dados)
str(dados)

#Tratamento de dados
dt <- dados %>% 
  filter(Estado == c("SaoPaulo","RioJaneiro","RioGrandeSul")) %>% #Filtro por Estados SP, RJ e RS
  group_by(Estado) %>% 
  summarise(cheg_2014 = sum(cheg_2014), cheg_2015 = sum(cheg_2015)) %>% 
  #Soma as chegadas de cada Ano, respeitando o agrupamento por Estado
  pivot_longer(cols = c(cheg_2014, cheg_2015), 
               names_to = "Ano", values_to = "Chegadas") #Transforma tabela larga em longa
View(dt)

#Plotagem
ggplot(dt, aes(x=Ano, y=Chegadas/1000, fill= Estado))+
  #Adiciona camada fill (legenda)
  geom_bar(stat = "identity",position = "dodge")+ #Barras lado a lado
  labs(title = "Gráfico de Barras",
       subtitle = "Chegadas ao Brasil por estado e ano",
       x = "Ano",
       y = "Chegadas")+
  theme_bw(base_size = 18)+ #Tema "black and white" e tamanho da fonte
  theme(axis.text.x = element_text(angle = 90))+ #Angulo do rôtulo do eixo x
  theme(plot.title = element_text(hjust = 0.5))+ #Título centralizado
  theme(plot.subtitle = element_text(hjust = 0.5))+ #Subtítulo centralizado
  scale_fill_grey() #Escala de cinza na camada fill (legenda)

#Fechando dispositivo gráfico
dev.off()
