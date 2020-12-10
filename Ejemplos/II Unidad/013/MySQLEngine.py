# -*- coding:utf-8 -*- 

"""
    @author edgar.benedetto@unah.hn
    @date 04-12-2020
    @version 0.1

"""
import mysql.connector

class MySQLEngine:
    def __init__(self, config):
        self.server = config.server
        self.port = config.port
        self.user = config.user
        self.password = config.password
        self.database = config.database 

        self.start()

    def start(self):
        #El metodo connect necesita el valor del servidor y demás por lo tanto se debe decir el nombre del campo
        self.con = mysql.connector.connect(
            host = self.server,
            port = self.port,
            user = self.user,
            password = self.password,    
            database = self.database 
        )
        
        #Versión texto de la conexión "con"
        print("Versión de texto del objeto de conexión a MySQL: %s " % (self.con))

        #Enlace (conexión con la base de datos)
        #Se puede hacer uso de link en cualquier parte de la clase
        self.link = self.con.cursor()

    #FetchAll --> obtiene todos los registros en una sola variable 
    def select(self, query=""):
        self.link.execute(query)
        return self.link.fetchall()
