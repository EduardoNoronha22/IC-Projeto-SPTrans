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
  diferenca_tempo[i,] <- difftime(Tempo[i], "2016-07-30 00:00:00")
  i <- i + 1
}

plot(diferenca_tempo, pch = 19, col = "red", xlab = "Frequência", main = "Tempo que veiculo se movimenta")
abline(h=mean(diferenca_tempo))