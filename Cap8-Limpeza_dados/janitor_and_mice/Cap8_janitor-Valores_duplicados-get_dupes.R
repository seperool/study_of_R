#janitor - get_dupes()
##Identifica registros duplicados

#Bibliotecas
library(magrittr)
library(janitor)

#data.frame
df = data.frame(ID = c(1000,1001,1000,1002),
                FAT = c(2098.60,345.00,2098.60,1332.44),
                ANO = c(2016,2016,2016,2017))

#Identificando registros duplicados - get_dupes()
##Metódo 1
get_dupes(df, ID, FAT)

##Metódo 2 - com uso de magrittr
df %>% 
  get_dupes(ID,FAT)
