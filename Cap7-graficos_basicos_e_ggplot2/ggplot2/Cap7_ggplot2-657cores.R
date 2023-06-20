#Este código é para obter a paleta com 657 cores e seus respectivos nomes.

par(mar=c(0,0,0,0))
plot(0,0,
     type = "n",
     xlim=c(0,1),
     ylim=c(0,1),
     axes=FALSE,
     xlab="",
     ylab=""
     )
line <- 30
col <- 22
rect(
  rep((0:(col-1)/col),line),
  sort(rep((0:(line-1)/line),col),decreasing = T),
  rep((1:col/col),line),
  sort(rep((1:line/line),col),decreasing = T),
  border = "white",
  col = colors()[seq(1,line*col)]
)

#nome das cores
text(
  rep((0:(col-1)/col),line)+0.02,
  sort(rep((0:(line-1)/line),col),decreasing = T)+0.015,
  colors()[seq(1,line*col)],
  cex=0.5
)