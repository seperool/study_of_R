#ggplot2
#Escalas

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
p = ggplot(data = Turismo, aes(x=Estado, y=cheg_2012))
p+
  geom_blank()+
  labs(title = "Título",
       x = "Eixo x",
       y = "Eixo y",
       subtitle = "Subtítulo",
       caption = "Elaborado por ...")+
  theme_bw(base_size = 18)+ #Tema
  scale_x_discrete(limits=c("Amazonas","RioJaneiro")) 
  #Vetor de caracteres com os possíveis valores de escala e sua ordem.

#fechando dispositivo grafico
dev.off()
