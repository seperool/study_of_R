#Análise descritiva dos dados
#Tabulação dos dados - Variável numérica (continua)

#Bibliotecas
library(knitr) #Interpretação e compilação do documento rmd, formato tabela kable
library(magrittr) #Operador pipe " %>% ", concatena linhas de comando
library(readr) #Leitura de dados
library(janitor) #Limpeza de dados

#Leitura da base de dados
dados <- read.csv2(file = "~/Programacao/R/Dados/Dados_de_importacao/vendas.csv")
dados <- data.frame(dados)

#Exibindo as 6 primeiras linhas da base de dados
head(dados)

#Exibindo a estrutura dos dados
#Tipo das variáveis
str(dados)

#Cut para categorizar valor_compra em b intervalos
#Usar o metodo cut(dados, nclass.Sturges()) para separar as classes
#Por default a classe é com o lado esquerdo aberto e direito fechado (,]
intervalo1 = (cut(dados$valor_compra, b = nclass.Sturges(dados$valor_compra)))
intervalo1

#Tabela de frequência da variável valor_compra
#Tabela frequência da uma variável numérica continua
tb_valor1 = tabyl(intervalo1) %>% 
  adorn_totals() %>% 
  adorn_rounding(2)

tb_valor1

#Plotar tabela
kable(tb_valor1, align = "ccc",
      caption = "Tabela de frequência para variável numérica continua")

#---------------------------------------------------------------------------
#Cut para categorizar valor_compra em b intervalos
#Usar o metodo cut(dados, nclass.Sturges()) para separar as classes
#O comando "right = FALSE", inverte o intervalo de classe, esquerdo fechado e direito aberto [,).
intervalo2 = (cut(dados$valor_compra, b = nclass.Sturges(dados$valor_compra),
                  right = FALSE))
intervalo2

#Tabela de frequência da variável valor_compra
#Tabela frequência da uma variável numérica continua
tb_valor2 = tabyl(intervalo2) %>% 
  adorn_totals() %>% 
  adorn_rounding(2)

tb_valor2

#Plotar tabela
kable(tb_valor2, align = "ccc",
      caption = "Tabela de frequência para variável numérica continua")

#----------------------------------------------------------------------------
#Cut para categorizar valor_compra em b intervalos
#Entrando com os intervalos de classe
#O comando "right = FALSE", inverte o intervalo de classe, esquerdo fechado e direito aberto [,).
intervalo3 = (cut(dados$valor_compra, b = c(12,182,352,522,692,862),
                  right = FALSE))
intervalo3

#Tabela de frequência da variável valor_compra
#Tabela frequência da uma variável numérica continua
tb_valor3 = tabyl(intervalo3) %>% 
  adorn_totals() %>% 
  adorn_rounding(2)

tb_valor3

#Plotar tabela
kable(tb_valor3, align = "ccc",
      caption = "Tabela de frequência para variável numérica continua")
