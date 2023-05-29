#Paleta de cores do R básico

show_palette <- function(colors){
  image(1:n, 1, as.matrix(1:n), col = colors,
        xlab= "",ylab ="", xaxt = "n",
        yaxt="n", bty = "n")
}

n <- 10 # número de cores a exibir
alpha <- 1 # grau de transparência (valores entre 0 e 1)
#0 muito transparênte
#1 muito opaco

show_palette(rainbow(n,alpha))
show_palette(heat.colors(n,alpha))
show_palette(terrain.colors(n,alpha))
show_palette(topo.colors(n,alpha))
show_palette(cm.colors(n,alpha))
