#janitor - tabyl
#Tabulação cruzada - gera frequência da coluna x em y.



#Biblioteca
library(janitor)
library(dplyr)

#Criando uma tabela
cor_selo <- c("azul",
              "preto",
              "azul",
              "vermelho",
              "preto",
              "vermelho",
              NA,
              "preto",
              "vermelho",
              "preto",
              "azul")
categoria <- c("A", "B", NA,"C","A","A","C",NA,"B","B","A")

dt <- data.frame(x=cor_selo,y=categoria)
dt

#Tabulação cruzada entre x e y
#frequência de y em x
tabyl(dt,x,y)

#Tabulação cruzada entre x e y com adornos
tabyl(dt,x,y) %>% 
  adorn_percentages("row") %>% #Inclui porcentagens com base na linha
  adorn_pct_formatting() #Formata para %

tabyl(dt,x,y) %>% 
  adorn_percentages("col") %>% #Inclui porcentagens com base na coluna
  adorn_pct_formatting() #Formata para %

tabyl(dt,x,y) %>% 
  adorn_percentages("all") %>% #Inclui porcentagens com base no total geral
  adorn_pct_formatting() #Formata para %

tabyl(dt,x,y, show_na = F) %>%  #Exclui NA
  adorn_percentages("all") %>% #Inclui porcentagens com base no total geral
  adorn_rounding(2) %>% #Arredonda com 2 casas decimais
  adorn_ns() %>% #Inclui contagens
  adorn_title("combined", 
              row_name = "Cor de selo",
              col_name = "Categorias") #Adiciona títulos

#Arredondamentos
#half up - arredonda para cima
dt %>% 
  tabyl(x,y) %>% 
  adorn_percentages() %>% 
  adorn_rounding(digits = 0,rounding = "half up")

#half to even - arredonda para baixo
dt %>% 
  tabyl(x,y) %>% 
  adorn_percentages() %>% 
  adorn_rounding(digits = 0,rounding = "half to even")
