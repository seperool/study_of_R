#ggplot2
#Escalas parte 3
#scale_x_continuous

#Biblioteca
library(ggplot2) #Elaboração de gráficos
library(readr) #Leitura de dados
library(tibble) #Estruturação de data.frame

#Importação de dados
dados <- read_csv("/home/sergio/Programacao/R/Dados/Dados_de_importacao/turismo.csv")
View(dados)

#Transformando dados em tibble
Turismo <- tibble(dados)
class(Turismo)
is_tibble(Turismo)

#Plotando gráfico
p = ggplot(data = Turismo, aes(x=cheg_2012/1000, y=cheg_2013/1000))
p+
  geom_blank()+
  labs(title = "Título",
       x = "Eixo x",
       y = "Eixo y",
       subtitle = "Subtítulo",
       caption = "Elaborado por ...")+
  theme_bw(base_size = 18)+ #Tema
  scale_y_continuous(
    breaks = c(75,150,225),
    labels = c("75 mil","150 mil","225 mil"), #nome dos ticks do eixo y
    position = "right",
    trans = "reverse")+
  scale_x_continuous( limits = c(50,150)) #limites do eixo x

#fechando dispositivo grafico
dev.off()
