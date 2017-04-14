require(RSQLite)
require(LSD)

setwd("C:/Users/Eduardo Noronha/Desktop")  #Seta o endereço do arquivo
connection = dbConnect(SQLite(), "SPTransDB_IC.db") #Faz a conexão com o BD

localizacao <- dbGetQuery(conn = connection, "SELECT * FROM locations")     #Linha, tempo e coordenadas das rotas

heatscatter(localizacao$vs_py , localizacao$vs_px, main = "Heatmap localização", xlab = "x", ylab = "y")