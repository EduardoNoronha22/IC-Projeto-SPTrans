data<-read.table("C:/Users/Eduardo Noronha/Documents/GitHub/IC-Eduardo/Tratamento de Traces/Source/Resultados/Arquivo_Final(2014-02-01).txt", header=TRUE,sep=",", stringsAsFactors=F)

subdata <- data[data$ID == 0,]

Tempo <- as.matrix(subdata$Tempo)
X <- as.matrix(subdata$X)
Y <- as.matrix(subdata$Y)

i <- 1
diferenca_tempo <- matrix(data = 0, ncol = ncol(Tempo), nrow = nrow(Tempo) - 1)

while(i < nrow(Tempo) - 1){
  diferenca_tempo[i,] <- Tempo[i+1,] - Tempo[i,]
  i <- i + 1
}

i <- 1
while(i < nrow(diferenca_tempo)){
  if(diferenca_tempo[i,1] > mean(diferenca_tempo) + 50){
    plot(Y[i,], X[i,], type = "b", pch = 19, lty = 2, col = "red", xlab = "x", ylab = "y", main = "Localização dos veículos que \ntem tempo altos de não movimentação")
  }
  i <- i + 1
}