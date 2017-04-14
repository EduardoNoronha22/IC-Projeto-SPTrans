import sqlite3
import re

def conectaCursor(comando):
    bdconn = sqlite3.connect('SPTransDB_IC.db')
    cursor = bdconn.cursor()
    cursor.execute(comando)
    return cursor

def criaNodes():
    arquivo = open('BDSPTrans.nod.xml', 'w')
    arquivo.write("<nodes>\n")
    cursor = conectaCursor("SELECT DISTINCT shape_pt_sequence FROM shapes")
    numero_linhas = len(cursor.fetchall())
    i = 1
    j = 1
    while i < numero_linhas:
        numero = str(i)
        numero = re.sub(r'[(|)|,]', r'', numero)
        cursor = conectaCursor("SELECT shape_pt_lat, shape_pt_lon FROM shapes WHERE shape_pt_sequence = " + numero)
        for linha in cursor.fetchall():
            linha = str(linha)
            linha = re.sub(r'[(|)|,]', r'', linha)
            x, y = linha.split(' ')
            arquivo.write("    <node id=\"ID:" + str(i) + "-vei:" + str(j) + "\" x=\"" + str(x) + "\" y=\"" + str(y) + "\" />\n")
            j += 1
        i+=1

    arquivo.write("</nodes>")
    arquivo.close()

def criaEdges():
    arquivo = open('BDSPTrans.edg.xml', 'w')
    routes = open('BDSPTrans.nod.xml', 'r')
    arquivo.write("<edges>\n")
    routes.readline()
    linha = routes.readline()
    linha = linha.rsplit(" ")
    linha = linha[5]
    linha = linha.replace("id=\"", "")
    linha = linha.replace("\"", "")
    proximalinha = linha
    i = 1
    while proximalinha:
        proximalinha = routes.readline()
        proximalinha = proximalinha.rsplit(" ")
        proximalinha = proximalinha[5]
        print proximalinha
        proximalinha = proximalinha.replace("id=\"", "")
        proximalinha = proximalinha.replace("\"", "")
        (ID, _) = proximalinha.split("-")
        arquivo.write("    <edge from=\"" + linha + "\" id=\"" + ID + "-rota:" + str(i) + "\" to=\"" + proximalinha + "\" />\n")
        linha = proximalinha
        i+=1

    arquivo.write("</edges>")
    arquivo.close()

#criaNodes()
criaEdges()
#criaRoutes()
