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

#Primeros 10 registros
first10 = engine.select("SELECT * FROM Measure ORDER BY id ASC LIMIT 10")

#Ultimos 10 registros
last10 = engine.select("SELECT * FROM Measure ORDER BY id DESC LIMIT 10")

for id,device,temperature,date in first10:
    print("Registro: %s,%s,%s,%s" % (id,device,temperature,date))  

for id,device,temperature,date in last10:
    print("Registro: %s,%s,%s,%s" % (id,device,temperature,date))  
