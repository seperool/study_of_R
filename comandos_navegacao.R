###################################### OS ######################################

###########################
# Navegação pelo sistema
###########################

getwd()                                       # Mostra diretório atual (pwd)
setwd("caminho/")                             # Muda diretório (cd)
dir()                                         # Lista arquivos/diretórios (ls)

###########################
# Arquivos
###########################

file.create("novo_arquivo")                   # Cria arquivo
file.exists("arquivo")                        # Verifica se arquivo existe (retorna TRUE ou FALSE)
file.rename("old","new")                      # Renomeia arquivo (exemplo: de "old" para "new")
file.copy("arquivo","caminho_novo/")          # Copia arquivo
file.remove("arquivo")                        # Remove arquivo

###########################
# Diretórios
###########################

dir.create("novo_diretorio")                  # Cria diretório
dir.exists("diretorio")                       # Verifica se diretório existe (retorna TRUE ou FALSE)
unlink("caminho_diretorio/",recursive = TRUE) # Deleta diretório (recursive = TRUE remove subdiretórios e arquivos dentro)