data<-read.table("C:/Users/Eduardo Noronha/Documents/GitHub/IC-Eduardo/Tratamento de Traces/Source/Resultados/Arquivo_Final(2014-02-01).txt", header=TRUE,sep=",", stringsAsFactors=F)

subdata <- data[data$ID == 0,]

plot(subdata$Tempo, main="Tempo veiculo não se movimenta", ylab= "Tempo(s)", 
     xlab="Frequencia", col = "blue")