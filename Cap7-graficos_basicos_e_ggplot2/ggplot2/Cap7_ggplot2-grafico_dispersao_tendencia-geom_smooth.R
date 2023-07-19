#Gráfico de dispersão com linha de tendência
#geom_point + geom_smooth

#Bibliotecas
library(readr) #Leitura de dados
library(magrittr) #Operador pipe %>%, concatena linhas de comando
library(dplyr) #Manipulação de dados
library(tidyr) #Organização de dados
library(tibble) #Estrutura de data.frame
library(ggplot2) #Elaboração de gráficos
library(grid) #Adiciona funções gráficas ao sistema ggplot2 e é um pacote gráfico também
library(patchwork) #Layout, junta ggplot no mesmo gráfico

#Organizando os dados
set.seed(240517) #Semente de gerador de número pseudo-aleatório
x <- runif(30) #Valores aleatórios de uma distribuição uniforme
               #Vetor com 30 valores
y <- 2*(x+rnorm(30,0,0.1))+7 #rnorm() gera valores aleatórios de uma distribuição normal,
                             #vetor com 30 valores, 0 média, 0.1 desvio-padrão.
z <-rep(c("a","b"),c(15,15)) #Cria um vetor com os valores "a", "b" 
                             #repetidos 15 vezes cada um.
df <- data.frame(x,y,z)
model <- lm(y ~ x, df) #lm = Regressão linear, (y ~ x, data)
dfm <- data.frame(x,ym=predict(model))

#Plotagem
ggplot(df, aes(x, y, color = ""))+
  geom_point()+
  geom_smooth(method = "lm")+ #Método lm, Regressão linear
  labs(title = 
         sprintf("Regressão linear\nR-quadrado = %1.3f\nEquação: %1.2fX+%1.2f\nCoeficiente de correlação linear = %1.3f",
                 summary(model)$r.squared, #R-quadrado
                 summary(model)$coefficients[2], #coeficiente A de Y=AX+B
                 summary(model)$coefficients[1], #coeficiente B de Y=AX+B
                 cor(y,x)),#Coeficiente de correlação linear
       color = #legenda color (reta)
         sprintf("Equação: %1.2fX+%1.2f",
                 summary(model)$coefficients[2], #coeficiente A de Y=AX+B
                 summary(model)$coefficients[1]))+ #coeficiente B de Y=AX+B
         #Função de C printf, que retorna um vetor de caracteres,
         #contendo uma combinação formatada de texto e valores de variáveis
         #"\n" = Próxima linha
         #"%1.2f" = "%" imprimir argumentos,
                    #"1" tamanho minimo do campo,
                    #"2" número de casas decimais e 
                    #"f" ponto flutuante.
  scale_color_grey()+ #Adiciona escala de cinza na variável color
  scale_fill_grey()+ #Adiciona escala de cinza na variável fill
  theme_bw(base_size = 18)+ #Adiciona tema "black and white" e tamanho da fonte
  theme(plot.title = element_text(hjust = 0.5)) #Alinhamento horizontal do título

#Fechando dispositivo gráfico
dev.off()
