# -*- coding:utf-8 -*- 

"""
    @author edgar.benedetto@unah.hn
    @date 04-12-2020
    @version 0.1
    
    Generar instrucciones de inserción de base de datos MySQL 
    - Generar datos de inserción para la base de datos que permitan automatizar el completado
        del universo de datos de una tabla mediante comandos.
    - Usar Python para cumplir con los objetivos.
"""

import random, re
#timedelta permite generar diferenciales
from datetime import datetime, timedelta

class DataGenerator:
    def __init__(self, fileName):
        self.fileName = fileName
    
    #Registro por minuto
    def generate(self, minutes):
        f = open(self.fileName, "w")
        f.write("CREATE... USE... DROP...")
        f.close()

        #"a" es de agregado (append)
        f = open(self.fileName, "a")
        for i in range(minutes):
            f.write("INSERT INTO Measure(deviceId, temperature, date) VALUES (%d, %.2f, '%s');" % (int(random.random()*(4-1)+1)), (random.random()*(39-36)+36), (datetime.now() + timedelta(seconds=60*i)))
        f.close()

#1_000_000 = 1,000,000
#10 años 10*365*24*60
(DataGenerator(fileName="data.sql")).generate(10*365*24*60)

"""
La solución más optima
    Encapsular los métodos que generan los devices, las temperaturas y las fechas
"""