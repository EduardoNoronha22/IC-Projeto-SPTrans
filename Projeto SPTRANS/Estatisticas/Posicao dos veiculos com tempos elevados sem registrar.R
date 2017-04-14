require(RSQLite)

setwd("C:/Users/Eduardo Noronha/Desktop")  #Seta o endereço do arquivo
connection = dbConnect(SQLite(), "SPTransDB_IC.db") #Faz a conexão com o BD

localizacao <- dbGetQuery(conn = connection, "SELECT * FROM locations")     #Linha, tempo e coordenadas das rotas

linha1 <- dbGetQuery(conn = connection, "SELECT * FROM locations WHERE linha = 1")

Tempo <- as.matrix(linha1$tempo)
X <- as.matrix(linha1$vs_px)
Y <- as.matrix(linha1$vs_py)

i <- 1
diferenca_tempo <- matrix(data = 0, ncol = ncol(Tempo), nrow = nrow(Tempo) - 1)

while(i < nrow(Tempo) - 1){
  diferenca_tempo[i,] <- -1 * difftime(Tempo[i], Tempo[i+1])
  i <- i + 1
}

i <- 1
while(i < nrow(diferenca_tempo)){
  if(diferenca_tempo[i,1] > mean(diferenca_tempo)){
    plot(Y[i,], X[i,], type = "b", pch = 19, lty = 2, col = "red", xlab = "x", ylab = "y", main = "Localização dos veículos que \ntem tempo altos de não movimentação")
  }
  i <- i + 1
}