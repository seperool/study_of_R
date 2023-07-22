#Exercicio [3]

#Elabore um gráfico que exiba a variabilidade de chegadas dos estados de SP e RS,
#apresentando numa malha em que figure as regiões do Brasil nas quais esses estados
#estão inseridos.

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
  filter(Estado == c("SaoPaulo","RioGrandeSul")) %>% #Filtra pelos estados de SaoPaulo e RioGrandeSul
  rename("2012" = cheg_2012, "2013" = cheg_2013, "2014" = cheg_2014,"2015" = cheg_2015) %>% 
  pivot_longer(cols = c("2012", "2013", "2014", "2015"), 
               names_to = "Ano", values_to = "Chegadas") %>% #Transforma tabela larga em longa
  select(Estado, Regiao, Ano, Chegadas) %>% 
  group_by(Estado,Regiao,Ano) %>% 
  summarise(Chegadas = sum(Chegadas)) #Soma os valores de chegada, respeitando o agrupamento
dt$Ano = factor(dt$Ano) #Transforma coluna Ano em factor
View(dt)

#Plotagem
ggplot(dt, aes(x=reorder(Estado,Chegadas), y=Chegadas/1000, fill= Ano, color = Regiao ))+
  #Adiciona subcamadas (legendas) fill e color.
  geom_bar(stat = "identity", position = "dodge")+ #Barras lado a lado
  labs(title = "Gráfico Variabilidade chegadas ao Brasil",
       x = "Estado",
       y = "Chegadas")+
  theme_bw(base_size = 18)+ #Tema "black and white" e tamanho da fonte
  theme(axis.text.x = element_text(angle = 90))+ #Angulo do rôtulo do eixo x
  theme(plot.title = element_text(hjust = 0.5))+ #Título centralizado
  scale_fill_grey() #Escala cinza

#Fechando dispositivo gráfico
dev.off()
