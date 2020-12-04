# -*- coding:utf-8 -*- 

"""
    @author edgar.benedetto@unah.hn
    @date 04-12-2020
    @version 0.1

"""


class ConectionConfig:

    def __init__(self, server, port, user, password, database):
        self.server, self.port, self.user, self.password, self.database = server, port, user, password, database

