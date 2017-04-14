data<-read.table("C:/Users/Eduardo Noronha/Documents/GitHub/IC-Eduardo/Tratamento de Traces/Source/Resultados/Arquivo_Final(2014-02-01).txt", header=TRUE,sep=",", stringsAsFactors=F)

subdata <- data[data$ID == 3,]
x <- as.matrix(subdata$Tempo)

i <- 1
y <- matrix(data = 0, ncol = ncol(x), nrow = nrow(x) - 1)
while(i < nrow(x) - 1){
  y[i,] <- x[i+1,] - x[i,]
  i <- i + 1
}

plot(y, pch = 19, col = "red", xlab = "Frequência", main = "Tempo entre informação de localização")
abline(h=mean(y))
