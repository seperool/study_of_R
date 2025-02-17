# Importação de dados pelo import dataset
View(vendas1)

# Leitura de dados de arquivo em URL
dados = read.csv2(file = "https://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")
head(dados)
dados1 = readr::read_csv2(file = "https://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")
head(dados1)
dados2 = read.csv(file = "https://raw.githubusercontent.com/Lucianea/Alta/master/vendas1.csv")
head(dados2)
dados3 = readr::read_csv(file = "https://raw.githubusercontent.com/Lucianea/Alta/master/vendas1.csv")
head(dados3)

# Exibir mais linhas
print(dados1, n=15)

# Exibir numero x de colunas
getOption("width")
print (dados, width=35)

#Criando uma tabela com tibble
library(tibble) #carregar pacote tibble
x1 = tibble(x=1:3,y=10:12,z=c("A1","A2","A3"))
x1

#Criando uma tabela com data.frame
x2=data.frame(x=1:3,y=10:12,z=c("A1","A2","A3"))
x2

#Transformando x2 em tibble
x2=as_tibble(x2) #transforma data.frame em tibble
is_tibble(x2) #booleano, é tibble? true ou false

#identificação e transformação de tipo da viariavel
#identificação da variavel
is.numeric(dados$valor_compra)
is.numeric(dados1$valor_compra)
is.factor(dados$filial) #factor é uma variavel categorica, diferente de caractere
is.character(dados$filial)
is.factor(dados1$filial)
is.character(dados1$filial)

#transformando uma variavel filial de dados1 de tipo caractere para tipo fator.
is.character(dados1$filial)
is.factor(dados1$filial)

dados1$filial=as.factor(dados1$filial)

is.character(dados1$filial)
is.factor(dados1$filial)

#OBS.: transformar uma variavel caractere em numerica e vice-versa
is.character(dados3$filial)
filial = as.factor(dados3$filial) #converte de caractere para fator
filial
is.factor(filial)

filial= as.numeric(filial) #de fator para numerico
is.numeric(filial)
filial

filial = as.character(filial) #por fim, de numerico de volta para caractere
is.character(filial)
filial

