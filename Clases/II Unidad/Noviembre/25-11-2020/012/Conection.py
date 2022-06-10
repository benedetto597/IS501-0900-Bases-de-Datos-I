# -*- coding:utf-8 -*- 

import mysql.connector 

"""
    @author edgar.benedetto@unah.hn
    @date 04-12-2020
    @version 0.1

    En el interprete de python para poder ver la ayuda de connector se deben usar los siguientes comandos:
    - import mysql.connector
    - help(mysql.connector)
    - help(mysql.connector.cursor)

    Instalar mysql.connector
    - sudo -H pip3 install mysql-connector-python
"""

#Genera una conexión usando parametros del metodo connect
mydb = mysql.connector.connect(
    host="localhost",
    port="3306",
    user="admin",
    password="admin",
    database="Example"
)

#Imprime el objeto de conexión
print("Versión texto del objeto conexión a MySQL: %s" %(mydb))

#Se crea el cursor de python como enlace para crear transacciones 
#Cursor --> sirve como enlace para ejecutar transacciones
link = mydb.cursor()

#Se crea una transacción de ejecución
link.execute("SELECT * FROM Measure LIMIT 10;")
result = link.fetchall()

#Se recorren e imprimen los resultados
for id, device, temperature, date in result:
    print("Registro: %s, %s, %s, %s" % (id, device, temperature, date))

#------------------------------ Tarea ------------------------------  
# Experimentar con el resto de transacciones de SQL 