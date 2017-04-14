data<-read.table("C:/Users/Eduardo Noronha/Documents/GitHub/IC-Eduardo/Tratamento de Traces/Source/Resultados/Arquivo_Final(2014-02-01).txt", header=TRUE,sep=",", stringsAsFactors=F)

subdata <- data[data$Tempo < 3600,]
Tempo <- as.matrix(subdata$Tempo)
ID <- as.matrix(subdata$ID)
i<- 1

veiculos <-matrix(nrow = nrow(ID), ncol = 2)
veiculos[,2] = 0
id_anterior <- -1

j<- 0
while(i < nrow(Tempo)){
  if(Tempo[i,] <= 3600){
    if(ID[i,] != id_anterior){
      j<- j + 1
      veiculos[j,1] <- ID[i, ]
      id_anterior <- ID[i,]
    }
    else{
      veiculos[j,2] <- veiculos[j,2] + 1
    }
  }
  i <- i + 1
}
plot(veiculos, col = "blue",  pch = 19, xlab = "ID", ylab = "Frequência", las = 1,
     main = "Quantidade de veículos que \nestão em um periodo de tempo")

