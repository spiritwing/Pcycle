#!/usr/bin/python
#coding:utf-8
import web
from settings import dbconn
from datetime import datetime

def getUserByUsername(username):
    res = dbconn.query("""
                            select * from user_info ui 
                                 left join user_stat ut
                                 on ui.userid = ut.userid
                                 where ui.userName = $username
                       """
         ,vars=dict(username=username))
    u = web.listget(res,0,None)
    return u    


def getUserByID(userid):
    res = dbconn.query("""
                            select * from user_info ui 
                                 left join user_stat ut
                                 on ui.userid = ut.userid
                                 where ui.userid = $userid
                       """
        ,vars=dict(userid=userid))
    u = web.listget(res,0,None)
    return u


def create(**argv):
    user = dbconn.insert("user_info",  
    createdate = datetime.now(),
    **argv
    )
    return user
