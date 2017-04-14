from Classes import veiculo

def Percorre_Arquivo(arquivo, c):
    cont = 0
    buffer = ""
    while buffer[-1::] != c:
        buffer = buffer + arquivo.read(1)
        cont += 1
        if cont > 100:
            break
    buffer = buffer.replace(c, "")
    return buffer

def Le_Linha(arquivo):
    carro = veiculo()

    buffer = Percorre_Arquivo(arquivo, ";")
    carro.set_id(int(buffer))

    buffer = Percorre_Arquivo(arquivo, " ")
    carro.set_data(str(buffer))

    buffer = Percorre_Arquivo(arquivo, ".")
    carro.set_horario(str(buffer))

    Percorre_Arquivo(arquivo, "(")
    buffer = Percorre_Arquivo(arquivo, " ")
    carro.set_x(float(buffer))

    buffer = Percorre_Arquivo(arquivo, ")")
    carro.set_y(float(buffer))

    return carro

def Cria_Arquivo_Auxiliar():
    i = 1
    conteudo = ""                                # Inicializa buffer
    arquivo = open("Arquivo_Auxiliar.txt", "w")  # Endereço do arquivo

    while i < 158:
        if i < 10:
            endereço = "taxi_february.txt.00" + str(i)
        elif i < 100:
            endereço = "taxi_february.txt.0" + str(i)
        else:
            endereço = "taxi_february.txt." + str(i)
        texto = open(endereço, "r")
        conteudo = texto.readlines()
        arquivo.writelines(conteudo)
        i = i + 1

    texto.close()
    arquivo.close()


