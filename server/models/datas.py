#!/usr/bin/python
#coding:utf-8

import web
from settings import dbconn
from datetime import datetime
from helpers.utils import date_to_timestamp

def multiple_insert(vs):
    a = dbconn.multiple_insert("user_data", vs)
    return True

def getLastTimeStamp(userid):
    r = web.listget( dbconn.query("select max(timeStamp) as timeStamp from user_data where userid=$userid",vars=dict(userid=userid)), 0, None)
    if r:
        return date_to_timestamp(r.timeStamp)
    return None

def getData(userid,start,end):
    return dbconn.query("select * from user_data where userid=$userid limit 3600",vars=dict(userid=userid))
