#Exercicio [2]

#Elabore um gráfico de pizza para a proporção de chegadas de turistas
#em cada região do Brasil.

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
  select(Mes, cheg_2012, cheg_2013, cheg_2014, cheg_2015, Regiao) %>% 
  group_by(Regiao) %>% 
  summarise(cheg_2012 = sum(cheg_2012),cheg_2013 = sum(cheg_2013),
            cheg_2014 = sum(cheg_2014), cheg_2015 = sum(cheg_2015)) %>% 
  pivot_longer(cols = c(cheg_2012, cheg_2013, cheg_2014, cheg_2015), 
               names_to = "Ano", values_to = "Chegadas")
dt <- dt %>% 
  group_by(Regiao) %>% 
  summarise(Chegadas = sum(Chegadas))
dt <- data.frame(dt)

#Calculando as porcentagens
dt$Chegadas
total = sum(dt$Chegadas)
porcent = 0
n=1
while (n <= 6) {
  porcent[n] = round((dt$Chegadas[n]*100)/total,2)
  porcent[n]
  n = n+1
}
porcent

#Adicionando nova coluna
dt <- dt %>% 
  mutate(Porcentagem = porcent)
View(dt)

#Plotagem
ggplot(dt,aes(x=1, weight = Chegadas, fill= Regiao))+
  geom_bar(color = "black")+
  coord_polar(theta = "y")+
  geom_text(x = 1.3,
            aes(y = cumsum(Chegadas[6:1]) - Chegadas[6:1]/2, 
                label = paste0(100*round(Chegadas[6:1]/sum(Chegadas[6:1]),3), "%")))+
  scale_x_continuous(breaks = NULL)+ #Retirar a escala x
  scale_y_continuous(breaks = NULL)+ #Retirar a escala y
  labs(title = "Gráfico circular",
       subtitle = "Chegadas ao Brasil por região",
       x = "",
       y = "Fatia das chegadas ao Brasil")+
  theme_bw(base_size = 18)+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(plot.subtitle = element_text(hjust = 0.5))+
  theme(panel.grid = element_blank())+
  scale_fill_grey(start = 0.3, end = 1) #Escala de cores cinza.

#Fechando dispositivo gráfico
dev.off()
