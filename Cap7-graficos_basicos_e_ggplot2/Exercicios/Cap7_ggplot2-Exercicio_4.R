#Exercicio [4]

#Apresente um gráfico de linhas com o número de chegadas de turistas ao
#Estado do Rio de Janeiro no período 2010-15 e apresente a sua suavização.

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
  filter(Estado == c("RioJaneiro")) %>%  #Filtra Estado RioJaneiro
  rename("2012" = cheg_2012, "2013" = cheg_2013, "2014" = cheg_2014,"2015" = cheg_2015) %>% 
  pivot_longer(cols = c("2012", "2013", "2014", "2015"), 
               names_to = "Ano", values_to = "Chegadas") %>% #Transforma tabela larga em longo
  select(Estado, Mes, Ano, Chegadas)
dt$Ano = factor(dt$Ano) #Coluna Ano em factor
View(dt)

#Plotagem
ggplot(dt, aes(x=Mes, y=Chegadas/1000 ))+
  #geom_point(size = 1.5)+
  geom_jitter()+ #Efeito jitter (espalha os dados)
  geom_smooth(size = 1.0, span = 0.5)+ #Curva suavizada 0.5
  scale_x_continuous(limits = c(1,12), #Limites do eixo x
                     breaks = seq(1,12,1))+ #Espaçamento do eixo x
  labs(title = "Gráfico de Linhas",
       subtitle = "Chegadas de turistas ao Rio de Janeiro de 2010-15",
       x = "Mês",
       y = "Chegadas")+
  theme_bw(base_size = 18)+ #Tema "black and white" e tamanho da fonte
  theme(axis.text.x = element_text(angle = 90))+ #Ângulo do texto do eixo x
  theme(plot.subtitle = element_text(hjust = 0.5))+ #Subtítulo centralizado
  theme(plot.title = element_text(hjust = 0.5))+ #Título centralizado
  scale_fill_grey() #Escala de cinza

#Fechando dispositivo gráfico
dev.off()
