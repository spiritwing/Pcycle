#!/usr/bin/python
#coding:utf-8
import web
from settings import dbconn
from helpers.utils import get_session


def getUserBySessionId(session_id):
    session = get_session(session_id)
    if not session:
        return None
    userid = session.data
    user = getUserByID(userid)
    return user


def getUserByID(userid):
    res = dbconn.query("select * from user where userid = $userid",vars=dict(userid=userid))
    u = web.listget(res,0,None)
    return u
