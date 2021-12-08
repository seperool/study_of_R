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
library(tibble) 
x1 = tibble(x=1:3,y=10:12,z=c("A1","A2","A3"))
x1

#Criando uma tabela com data.frame
x2=data.frame(x=1:3,y=10:12,z=c("A1","A2","A3"))
x2

#Transformando x2 em tibble
x2=as_tibble(x2) #transforma data.frame em tibble
is_tibble(x2) #booleano, é tibble? true ou false
