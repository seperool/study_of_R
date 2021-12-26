install.packages("rmarkdown") #pacote para fazer relatorio, rmd
install.packages("knitr") #
install.packages("data.table") #
install.packages("janitor") #
install.packages("DescTools") #

devtools::install_github("hadley/devtools") #quebrado achar equivalente

install.packages("tidyverse") #Conjunto de pacotes para leitura, manipulação, exploração e compartilhamento de dados
#ggplot2 (visualização)
#tibble (tipo de data.frame) 
#tidyr (organização de dados)
#readr (leitura de dados)
#purrr (programação funcional)
#dplyr (manipulação de dados)
install.packages("foreign") #leitura de arquivos com extensão minitab, Octave, ...
install.packages("tidyr") #pacote auxiliará a organização dos dados, tendo duas propriedades:
#cada coluna é uma variavel
#cada linha é uma observação

#não ta funcionando, testar mais devtools

#obs.: mais seguro, baixar a versão do github, por ser a mais atualizada
devtools::install_github("tidyverse/tidyr")
