from Funcoes import Le_Linha, Cria_Arquivo_Auxiliar
import time
from Classes import veiculo

ini = time.time()
header = "ID;Time;Coodenadas_X;Coordenadas_Y"
#print("Começa a criar Arquivo Auxiliar...")
#Cria_Arquivo_Auxiliar()
#print("Criação do Arquivo Auxiliar completada com sucesso")
#atual = time.time()
#print(atual-ini)

data = "2014-02-02"

arquivo = open("Arquivo_Auxiliar.txt", "r")
endereço = "Resultados/Arquivo_Final (" + data + ").txt"
arquivo2 = open(endereço, "w")

lista_veiculos = []


print("Começando a criar vetor de veiculos...")
while arquivo.readline():
    auxiliar = Le_Linha(arquivo)
    if auxiliar.get_data() == data:
        lista_veiculos += [auxiliar]
    if auxiliar.get_data() > data:
        break

print("Criação de lista de veiculos completada com sucesso")
atual = time.time()
print(atual-ini)

print("Começando a Ordenação da lista de veiculos...")
lista_veiculos.sort(key=lambda a: a.id)
print("Ordenação de veiculo completada com sucesso")
atual = time.time()
print(atual-ini)

i= 0
id = lista_veiculos[i].get_id()
arquivo2.write(header);
arquivo2.write("\n");
arquivo2.write(lista_veiculos[i].__str__())

print("Começando a gravar lista de veiculos no arquivo...")
while i < lista_veiculos.__len__():
    if(lista_veiculos[i].get_id() == id):
        arquivo2.write(lista_veiculos[i].__str1__())
    else:
        arquivo2.write("\n\n")
        arquivo2.write(lista_veiculos[i].__str__())
        id = lista_veiculos[i].get_id()
    i += 1

print("Lista de veiculo gravada com sucesso")
arquivo.close()
arquivo2.close()

fim = time.time()
print("Tempo: ", fim-ini)
