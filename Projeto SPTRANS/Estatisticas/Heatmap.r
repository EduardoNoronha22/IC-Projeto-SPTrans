require(RSQLite)
require(LSD)

setwd("C:/Users/Eduardo Noronha/Desktop")  #Seta o endere�o do arquivo
connection = dbConnect(SQLite(), "SPTransDB_IC.db") #Faz a conex�o com o BD

localizacao <- dbGetQuery(conn = connection, "SELECT * FROM locations")     #Linha, tempo e coordenadas das rotas

heatscatter(localizacao$vs_py , localizacao$vs_px, main = "Heatmap localiza��o", xlab = "x", ylab = "y")