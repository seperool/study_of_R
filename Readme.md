# Objetivo

Estudo dirigido de linguagem R.  

# Livro de referência

Utilizando a Linguagem R.  
Editora: ALTA BOOKS EDITORA  

# Assuntos por capitulos e resumos

## Cap 1 - Instalação do R e Rstudio 

## Cap 2 - Pacote base e funções estatísticas básicas 

## Cap 3 - Principais pacotes 

1.  Principais pacotes:  

-   **Rmarkdown**  
    Produção de relatorios(html, pdf, doc, md).  

-   **knitr**  
    Interpretação e compilação do documento rmd.  

-   **data.table**  
    Exploração de data.frames.  

-   **janitor**  
    Limpeza de dados.  

-   **DescTools**  
    Analise descritiva de dados.  

-   **tidyverse**  
    conjunto de pacotes.  

    -   **readr**  
        Importação e leitura de arquivos de dados.  
    -   **tibble**  
        estruturação de data.frame.  
    -   **dplyr**  
        Manipulação de data.frame.  
    -   **tidyr**  
        Organização de data.frame.  
    -   **ggplot2**  
        Visualização de dados, produção de gráficos.  
    -   **purr**  
        Manipulação de vetores e listas.  

1.  Instalação de pacotes:  

-   sintaxe de instalação:  
    **install.packages**(“*nome do pacote*”)  
-   sintaxe de variais instalações simultaneas:  
    **install.packages**(c(“*nome do pacote*”,“*nome do pacote*”,…),
    dependencies = **TRUE**)  

## Cap 4 - R Markdown 

## Cap 5 - Pacotes do Tidyverse e identificando/mudando tipos de variaveis 

1.  identificando/mudando tipos de variaveis  

    1.  identificando:  
        uso do **is**.  
    2.  mudando o tipo de variavel:  
        uso do **as**.  

2.  pacotes do Tidyverse:  

<!-- -->

    - **readr**\
    Leitura de dados.\

    - **tibble**\
    Tipo de data.frame.\

    - **magrittr**\
    Operador pipe '%>%', concatena linhas de comando.\

    - **dplyr**\
    Manipulação de dados.\

      i. munipulação de dados:\
          - *select*\
          seleciona e retorna as colunas selecionadas da tabela.\
          
          - *pull*\
          extrai uma coluna de uma tabela de dados e retorna ela como vetor.\
          
          - *filter*\
          filtra linhas.\
          
          - *distinct*\
          remove linhas com valores repetidos.\
          
          - *arrange*\
          reordena ou combina linhas.\
          
          - *mutate*\
          cria novas colunas.\
          
          - *transmute*\
          cria novas colunas, mas não adiciona na base de dados.\
          
          - *summarise*\
          sumariza valores.\
          
          - *group_by*\
          permite operações por grupo.\
          
          - *add_column*\
          adiciona novas colunas.\
          
          - *add_row*\
          adiciona novas linhas.\
          
          - *rename*\
          renomeia uma coluna.\
        
      ii. combinando tabelas de dados:\
          - *bind_cols*\
          - *bind_rows*\
          - *inner_join*\
          - *left_join*\
          - *right_join*\
          - *full_join*\
          - *intersect*\
          retorna a interseção entre tabelas.\
          
          - *union*\
          retorna a união de tabelas.\
          
          - *setdiff*\
          retorna a diferença entre tabelas.\
          
          - *setequal*\

-   **tidyr**  
    Organização de dados.  

    -   *pivot_longer* ou *gather*  

    -   *pivot_wider* ou *spread*  

    -   *separate*  

    -   *unite*  

    -   *complete*  
        Completa as combinações de duas colunas, se não houver valor
        completa com *NA*.  

    -   *drop_na*  
        Elimina as linhas, especificadas ou não, com valor NA.  

    -   *replace_na*  
        Substitui o valor NA por outro valor especificado.  

## Cap 6 - Pacote data.table 

1.  **data.table**  
    -   Manipulando linhas  
    -   Manipulando colunas  
    -   Sumarizando dados  
    -   Operando um subconjunto de dados
        -   *lapply*  
    -   modificando dados com set:
        -   *set*  
            modificando um valor.  
        -   *setnames*  
            modificando nome da coluna.  
        -   *setorder*  
            modificando ordem das linhas.  
        -   *setcolorder*  
            modificando ordem das colunas.  

## Cap 7 - Gráficos basicos e pacote ggplot2 

1.  Gráficos basicos:  
    -   Gráfico de barras  
    -   Gráfico circular (pizza)  
    -   Gráfico de linhas  
    -   Gráfico de dispersão  
    -   Histograma  
    -   Boxplot (diagrama de caixa)  
2.  Pacote **ggplot2**

# Andamento dos Estudos

## Assunto em andamento:

Atualmente estou estudando exercicios de gráficos basicos.  

## Em andamento:

## Vazios:

## Finalizando detalhes:

-   Cap5_tidyr-pivot_longer\_\_gather_ex1.R  
-   Cap5_tidyr-pivot_longer\_\_gather_ex2.R  
-   Cap5_tidyr-pivot_wider\_\_spread.R  
-   Cap5_tidyr-separate.R  
-   Cap5_tidyr-unite.R  
-   Cap7_basic_graficos-grafico_de_dispersao.R  
-   Cap7_basic_graficos-grafico_histograma.R  
