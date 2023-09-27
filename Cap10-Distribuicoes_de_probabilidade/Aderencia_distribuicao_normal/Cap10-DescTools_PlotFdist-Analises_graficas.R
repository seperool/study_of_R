#Aderência da distribuição normal
##Análise gráfica usando pacote DescTools
##histograma, boxplot e densidade empírica

#Bibliotecas
library(readr) #Leitura de dados
library(DescTools) #Análise descritiva de forma rápida e completa

#Importação de dados
dados = read.csv2(file = "~/Programacao/R/Dados/Dados_de_importacao/vendas.csv")
dados
str(dados)
summary(dados)

#Ajuste da distribuição normal para vetor y
y <- dados$valor_compra
PlotFdist(y,
          args.curve = list(expr = "dnorm(x, mean(y), sd(y))",
          col = "Black"),
          args.dens = list(col = "gray"),
          #args.boxplot = NA,
          args.ecdf = NA,
          xlim = c(-500, 1000))

#Organizando a legenda
legend(x = "topright",
       legend = c("kernel density", #Legenda 1
                  expression(X%~%N(mu==31.75, sigma==7.94))), 
       #Legenda 2 - Expressão matemática
       fill = c("gray80","black"),
       text.width = 0.2) #Tamanho da caixa de legenda

#Fechando dispositivo gráfico
dev.off()
