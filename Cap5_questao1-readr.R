library(readr)
acidentes <- read_delim("Documentos/Dados_uff_R/acidentes.csv", 
                        delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(acidentes)