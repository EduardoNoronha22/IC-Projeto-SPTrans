data<-read.table("C:/Users/Eduardo Noronha/Documents/GitHub/IC-Eduardo/Tratamento de Traces/Source/Resultados/Arquivo_Final(2014-02-01).txt", header=TRUE,sep=",", stringsAsFactors=F)

subdata <- data[data$ID == 0,]
require(ggplot2)
require(LSD)
#print(ggplot(subdata,aes(x=X,y=Y)) + stat_binhex())

heatscatter(data$X, data$Y, main = "Heatmap localização")