#janitor - excel_numeric_to_date

#Converte número para o formato data (classe date)
#de um arquivo importado do excel.

#Bibliotecas
library(magrittr) #Operador pipe "%>%", concatena linhas de comando
library(janitor) #Limpeza de dados

#Aplicação da função excel_numeric_to_date
#Metódo 1
excel_numeric_to_date(51503)

#Metódo 2 - MAC
excel_numeric_to_date(51503, date_system = "mac pre-2011")

#Metódo 3 - com magrittr
dt <- 51503
dt %>% 
  excel_numeric_to_date()


