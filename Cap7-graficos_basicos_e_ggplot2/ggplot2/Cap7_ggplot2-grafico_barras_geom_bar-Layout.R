#Gráfico de barras com ggplot2
#geom_bar

#Bibliotecas
library(ggplot2) #Elaboração de gráficos
library(magrittr) #Operador pipe %>%, concatena linhas de comando
library(readr) #Leitura de dados
library(grid) #Adiciona funções gráficas ao sistema ggplot2 e é um pacote gráfico também
library(patchwork) #Layout, juntar ggplot no mesmo gráfico 
library(dplyr) #Manipulação de dados
library(tibble) #Estruturação de data.frame
library(tidyr) #Organização de dados

#Importando dados
dados <- read.csv(file = "/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
dados <- tibble(dados)
#View(dados)

#Preparação dos dados
dt <- dados %>% 
  filter(Estado == "SaoPaulo" | Estado == "RioJaneiro") %>% 
  rename('2012' = cheg_2012, '2013' = cheg_2013, '2014' = cheg_2014, '2015' = cheg_2015) %>% 
  gather(ano, chegada, '2012':'2015') %>% 
  select(Estado, ano, chegada) %>% 
  group_by(Estado,ano) %>% 
  summarize(chegada=sum(chegada)) %>% 
  ungroup()

#Convertendo ano para fator
dt$ano = factor(dt$ano)

#Visualizando dados
dt
View(dt)

#Plotagem gráfico de barras com duas ou mais categorias
p = ggplot(dt)+
  aes(x=reorder(Estado,chegada), y=chegada/1000, fill = ano)+ #Mapeamento das variáveis
  geom_bar(stat = "identity",position = "dodge")+ #Forma de barras
  geom_text(aes(label = round(chegada/1000,2)), 
            position = position_dodge(width = 0.9), 
            vjust=-0.25) #Insere valores sobre as barras

#Adicionando camadas a p
p1 = p +
  labs(title = "Chegada de Turistas ao Brasil - Versão barras lado a lado",
       x = "Estados",
       y = "Número de chegadas por mil")+
  theme_bw(base_size = 18)+ #Insere tema
  theme(plot.title = element_text(hjust = 0.5))+ #Centraliza o título
  scale_fill_grey(start = 0, end = 0.9) #Ajusta a escala de cinza

p1

#Plotando versão barras empilhadas
p = ggplot(dt)+
  aes(x=reorder(Estado,chegada), y=chegada/1000, fill = ano)+ #Mapeamento das variáveis
  geom_bar(stat = "identity")+ #Forma de barras
  geom_text(aes(label = round(chegada/1000,2)), 
            position = position_stack(vjust=1)) #Insere valores sobre as barras

#Adicionando camadas a p
p2 = p+
  labs(title = "Chegada de Turistas ao Brasil - Versão barras empilhadas", #Título
       x = "Estados", #Eixo x
       y = "Número de chegadas por mil")+ #Eixo y
  theme_bw(base_size = 18)+ #Insere tema
  theme(plot.title = element_text(hjust = 0.5))+ #Centraliza o título
  scale_fill_grey(start = 0.4, end = 1) #Ajusta a escala de cinza

p2

#Layout (patchwork)
pp = p1 + p2 + plot_layout(ncol = 1) +
  plot_annotation(title = "Gráfico de Barras com duas ou mais categorias",
                  tag_levels = "1") #Título geral e número em cada gráfico

pp

#Fechando dispositivo gráfico
dev.off()
