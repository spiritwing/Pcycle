#!/usr/bin/python
#coding:utf-8

import web
from settings import dbconn
from datetime import datetime

def multiple_insert(vs):
    a = dbconn.multiple_insert("user_data", vs)
    return True
