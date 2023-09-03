#Bibliotecas
library(DBI) #Conecta R ao sistema de gerenciamento de banco de dados (SGBD)
library(odbc) #Componentes de conexão/interação com bancos de dados
library(RPostgres) #Conexão com Postgres
library(RMySQL) #Conexão com RMySQL
library(dbplyr) #Tradução de dplyr em dbplyr (SQL)
library(tidyverse) #Conjunto de pacotes para leitura, manipulação, exploração e compartilhamento de dados
library(sqldf) #Permite manipular data.frame em R com instruções SQL

# Conectando ao banco de dados
#odbc
con <- DBI::dbConnect(odbc::odbc(),
                      Driver = "PostgreSQL Driver", 
                      Server = "localhost", 
                      Database = "data_science", 
                      UID = "user", 
                      PWD = "senha",
                      Port = 5432)

#RPostgres
con <- dbConnect(RPostgres::Postgres(),
                 dbname = 'data_science', 
                 host = 'localhost',
                 port = 5432,
                 user = 'user',
                 password = 'senha')

#RMySQL
con = dbConnect(RMySQL::MySQL(),
                dbname='TESTE',
                host='localhost',
                port=3306,
                user='user',
                password='senha')

# Importando a tabela
db_funcionarios <- tbl(con, "funcionarios")
db_funcionarios

#Consulta remota usando dbplyr (dplyr do tidyverse) enviado para banco de dados
Consulta_resultado_remoto <- db_funcionarios %>% 
  select(idfuncionario, nome, sexo) %>% 
  filter(sexo == "Masculino")
Consulta_resultado_remoto

#Mostrando a query gerada a partir do tidyverse (dbplyr)
Consulta_resultado_remoto %>% 
  show_query()

#Extraindo resultado remoto para local - R
Consulta_resultado_local <- Consulta_resultado_remoto %>% 
  collect()
Consulta_resultado_local

#Exportando tabela do local(R) para remoto (BD)
copy_to(con, Consulta_resultado_local, name = "TESTE_R", overwrite = FALSE)

#Lista as tabelas no banco de dados
dbListTables(con)

#Desconectar do banco de dados
dbDisconnect(con)

#-------------------------------------------------------------------------------
#Manipulação data.frame local usando sqldf - instruções SQL
sql_inst = "
SELECT *
FROM Consulta_resultado_local;
"
sqldf(sql_inst)
