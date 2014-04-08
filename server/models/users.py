#!/usr/bin/python
#coding:utf-8
import web
from settings import dbconn
from datetime import datetime


def getUserByID(userid):
    res = dbconn.query("""
                            select * from user_info ui
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


def update(userid,u_dict):
    dbconn.update("user_info",where="userid=$userid",vars=dict(userid=userid),**u_dict)
    return True

def hasUserName(userName):
    return web.listget(dbconn.query("select * from user_info where userName=$userName",vars=dict(userName=userName)),0,None)

def getUserByEmail(email):
    return web.listget(dbconn.query("select * from user_info where email=$email",vars=dict(email=email)),0,None)
