#janitor

#Limpando nomes do data.frame - clean_names():
#Retorna nomes somente com letras em caixa baixa e com "_" como separador.
#Manipula caracteres especiais e espaços.
#Inclui números para nomes duplicados.
#Converte o símbolo "%" para "percent" preservando o sentido.

#Bibliotecas
library(janitor)

#Dados
dfp <- as.data.frame(matrix(ncol = 6))
names(dfp) <- c("OriGem",
                "REPETE",
                "REPETE",
                "% de acertos",
                "R!$@$&*",
                "")
dfp

#Limpando nomes
clean_names(dfp)

#Comparando com a função básica do R make.names()
#Substitui espeços e símbolos por pontos.
make.names(names(dfp))
#Não é uma solução ideial.
