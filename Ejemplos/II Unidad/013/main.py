# -*- coding:utf-8 -*- 

"""
    @author edgar.benedetto@unah.hn
    @date 04-12-2020
    @version 0.1
    
    Uso de SELECT en Python mediante POO y BD
    SELECT, INSERT, DELETE, Procedimiento almacenado etc
"""

from ConectionConfig import ConectionConfig
from MySQLEngine import MySQLEngine

config = ConectionConfig("localhost", "3306", "admin", "admin", "Example")
engine = MySQLEngine(config)

#Vista 1
result = engine.select("SELECT * FROM CountMonth2020;")
for month,count in result:
    print("Registro: %s,%s" % (month,count))  

#Vista 2
result = engine.select("SELECT * FROM CountByDayOnNovember2020;")
for hour,count in result:
    print("Registro: %s,%s" % (hour,count))  

#Tarea Cerrar la conexión con la base de datos