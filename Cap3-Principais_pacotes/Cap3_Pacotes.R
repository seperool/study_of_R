install.packages("stringr")       # Pacote para trabalhar com strings, texto
install.packages("rmarkdown")    # Pacote para criar relatórios (arquivos .Rmd)
install.packages("distill")      # Cria sites e blogs com ênfase em artigos científicos (autor, URL, afiliação)
install.packages("knitr")        # Interpretação e compilação de documentos .Rmd, formatação de tabelas (kable)
install.packages("kableExtra")   # Mais opções de formatação para tabelas kable
install.packages("pander")       # Converte objetos R para formato Pandoc, para gerar .md
install.packages("xtable")       # Ajuda na criação de tabelas LaTeX e HTML
install.packages("data.table")   # Manipulação eficiente de data.frames (alta performance)
install.packages("janitor")      # Limpeza e organização de dados
install.packages("mice")         # Imputação de valores faltantes
install.packages("DescTools")    # Análise descritiva rápida e completa
install.packages("lubridate")    # Manipulação e extração de datas
install.packages("devtools")     # Ferramentas para desenvolvimento de pacotes R
install.packages("tidyverse")    # Conjunto de pacotes para ciência de dados (leitura, manipulação, visualização)
# ggplot2                     # Criação de gráficos
# tibble                      # Data frames mais modernos e consistentes
# tidyr                       # Organização de dados (formato tidy)
# readr                       # Leitura eficiente de dados
# purrr                       # Programação funcional
# magrittr                    # Operador pipe "%>%" (encadeamento de operações)
# dplyr                       # Manipulação de dados (verbos para data frames)
install.packages("foreign")      # Leitura de arquivos de outros softwares estatísticos (Minitab, Octave, etc.)

# Pacotes auxiliares ggplot2
install.packages("ggthemes")     # Temas adicionais para gráficos
install.packages("grid")         # Funções gráficas de baixo nível (base para ggplot2)
install.packages("patchwork")    # Combinação de múltiplos gráficos ggplot2
install.packages("RColorBrewer") # Paletas de cores para gráficos
install.packages("extrafont")    # Suporte a fontes adicionais em gráficos
install.packages("showtext")     # Renderização de fontes em gráficos
install.packages("ggThemeAssist") # Interface gráfica para edição de temas ggplot2
install.packages("hrbrthemes")    # Temas, escalas e utilitários extras para ggplot2
install.packages("esquisse")     # Criação interativa de gráficos ggplot2 (point-and-click)
install.packages("likert")       # Visualizações para escalas Likert em ggplot2

# Conectores com banco de dados
install.packages("DBI")          # Interface para bancos de dados
install.packages("odbc")         # Conexão com bancos de dados via ODBC
install.packages("RSQLite")      # Conexão com bancos de dados SQLite
install.packages("RMySQL")       # Conexão com bancos de dados MySQL e MariaDB (pacote mais antigo)
install.packages("RMariaDB")     # Conexão com bancos de dados MariaDB (recomendado para MariaDB)
install.packages("RPostgres")    # Conexão com bancos de dados PostgreSQL (recomendado)
install.packages("RPostgreSQL")  # Conexão com bancos de dados PostgreSQL (alternativo, menos atualizado)
install.packages("bigrquery")    # Conexão com Google BigQuery
install.packages("dbplyr")       # Tradução de código dplyr para SQL
install.packages("sqldf")        # Execução de queries SQL em data.frames

# Regressão
install.packages("MASS")         # Funções estatísticas, incluindo `stdres` para resíduos padronizados
install.packages("psych")        # Funções para análise psicométrica, incluindo `pairs.panels` para multicolinearidade
install.packages("nnet")         # Modelos de regressão logística multinomial (`multinom`)