#janitor - top_levels

#A função top_levels(), do pacote janitor,
#realiza a contagem dos níveis da escala do tipo Likert.

#A função top_levels() fornece uma tabela com as contagens e percentuais
#dos níveis agrupados em três grupos:
#Alto
#Médio
#Baixo

#Bibliotecas
library(janitor) #Limpeza de dados

#Variável
f <- factor(c("neutro","concordo parcialmente",
              "discordo parcialmente","concordo",
              "concordo","concordo totalmente",
              "concordo totalmente","concordo","discordo totalmente"),
            levels = c("concordo totalmente",
                       "concordo parcialmente",
                       "neutro",
                       "discordo parcialmente",
                       "discordo totalmente"))

#Contagem levels
#n = nº de niveis no grupo alto e baixo
top_levels(f,n=1)
#Um nível no grupo alto, três níveis no grupo médio e um nível no grupo baixo.

top_levels(f,n=2)
#Dois níveis no grupo alto, um nível no grupo médio e dois níveis no grupo baixo.