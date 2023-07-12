#Gráfico circular (pizza) por ggplot2
#Gráfico de barras (empilhado, 1 coluna) + coordenadas polar = gráfico de circular

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe %>%, concatena linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(tibble) #Estruturação de data.frame
library(ggplot2) #Elaboração de gráficos
library(grid) #Adicionar funções gráficas ao sistema ggplot2 e é um pacote gráfico também
library(patchwork) #Layout, juntar ggplot no mesmo gráfico

#Organizando dados
d <- data.frame(orcamento = c(10,20,30,40),
                Empresa = c(paste("E",1:4)))

#Plotando gráficio
d %>% 
  ggplot(aes(x = 1, weight = orcamento, 
             fill = Empresa))+ #Gráfico de barras empilhado e coluna única, com variável de agrupamento.
  geom_bar(color = "black")+
  coord_polar(theta = "y")+ #Transforma variável y em polar e o gráfico de barras em circular.
  geom_text(x = 1.3,
            aes(y = cumsum(orcamento[4:1]) - orcamento[4:1]/2, 
                label = paste0(100*round(orcamento[4:1]/sum(orcamento[4:1]),3), "%")))+
  scale_x_continuous(breaks = NULL)+ #Retirar a escala x
  scale_y_continuous(breaks = NULL)+ #Retirar a escala y
  labs(title = "Gráfico circular com ggplot2",
       x = "",
       y = "Fatia do orçamento a ser pago")+
  theme_bw(base_size = 18)+ #Tema e tamanho da fonte base.
  theme(panel.grid = element_blank())+ #Não atribui nenhum valor as grades (sem desenho).
  scale_fill_grey(start = 0.6, end = 1) #Escala de cores cinza.

#Fechando dispositivo gráfico
dev.off()
