require(RSQLite)

rm(list=ls(all=TRUE)) #Limpa informações do R 
setwd("C:/Users/Eduardo Noronha/Desktop")  #Seta o endereço do arquivo
connection = dbConnect(SQLite(), "SPTransDB_IC.db") #Faz a conexão com o BD

Lista_de_colunas <- dbListTables(conn = connection) #Descobrir o nome das tabelas do BD

rotas <- dbGetQuery(conn = connection, "SELECT * FROM routes")    #Tabela com informações de rotas
calendario <- dbGetQuery(conn = connection, "SELECT * FROM calendar")   #Tabela com os dias de funcionamento de cada rota
fare_atributos <- dbGetQuery(conn = connection, "SELECT * FROM fare_attributes")  #Valor das passagens e tempo para integração
fare_regras <- dbGetQuery(conn = connection, "SELECT * FROM fare_rule")     #Rotas e tipos de veiculos de transporte
localizacao <- dbGetQuery(conn = connection, "SELECT * FROM locations")     #Linha, tempo e coordenadas das rotas

#Plot das rotas feitas pelas linhas 1, 4, 6 e 8 dos onibus

linha1 <- dbGetQuery(conn = connection, "SELECT * FROM locations WHERE linha = 1")
linha2 <- dbGetQuery(conn = connection, "SELECT * FROM locations WHERE linha = 4")
linha3 <- dbGetQuery(conn = connection, "SELECT * FROM locations WHERE linha = 6")
linha4 <- dbGetQuery(conn = connection, "SELECT * FROM locations WHERE linha = 8")

plot(linha1$vs_px, linha1$vs_py, xlab = "Y", ylab = "X", xlim = c(-46.6, -46.78), 
     ylim = c(-23.53, -23.68), col="red")
par(new =TRUE)
plot(linha2$vs_px, linha2$vs_py, xlab = "", ylab = "", xlim = c(-46.6, -46.78), 
     ylim = c(-23.53, -23.68), col="blue")
par(new=TRUE)
plot(linha3$vs_px, linha3$vs_py, xlab = "", ylab = "", xlim = c(-46.6, -46.78), 
     ylim = c(-23.53, -23.68), col="green")
par(new=TRUE)
plot(linha4$vs_px, linha4$vs_py, xlab = "", ylab = "", xlim = c(-46.6, -46.78), 
     ylim = c(-23.53, -23.68), col="purple")