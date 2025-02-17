#ggplot2

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
p <- ggplot(data = Turismo, aes(x=cheg_2012/1000,y=cheg_2013/1000)) #Salva gráfico em variável

#Aplicando elementos de texto na forma janela em branco
p +
  geom_blank() + #Produz efeito janela em branco
  ggtitle("Título",subtitle = "Subtítulo") + #Adiciona título e subtitulo ao gráfico
  xlab("Eixo x") + #Adiciona rótulo ao eixo x
  ylab("Eixo y") + #Adiciona rótulo ao eixo y
  labs(caption = "Elaborado por ...") + #Adciona texto ao final do gráfico
  theme_bw(base_size = 18)

#fechando janela gráfica
dev.off()