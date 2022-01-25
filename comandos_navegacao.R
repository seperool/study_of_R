#navegação pelo sistema
getwd() #pwd
setwd("caminho/") #cd
dir() #ls

#arquivos
file.create("novo_arquivo") #cria um novo arquivo
file.exists("arquivo") #existe este arquivo? TRUE ou FALSE
file.rename("old","new") #altera nome de arquivo
file.copy("arquivo","caminho_novo/") #copia o arquivo para um novo diretorio
file.remove("arquivo") #remove o arquivo nomeado

#diretorios
dir.create("novo_diretorio") #cria um novo diretorio
dir.exists("diretorio") #existe o diretorio? TRUE ou FALSE
unlink("caminho_diretorio/",recursive = TRUE) #deleta um diretorio