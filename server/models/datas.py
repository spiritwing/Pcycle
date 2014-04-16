#!/usr/bin/python
#coding:utf-8

import web
from settings import dbconn
from datetime import datetime
from helpers.utils import date_to_timestamp,get_last_Sunday

def multiple_insert_data(vs):
    a = dbconn.multiple_insert("user_data", vs)
    return True

def getLastTimeStamp(userid):
    r = web.listget( dbconn.query("select max(timeStamp) as timeStamp from user_data where userid=$userid",vars=dict(userid=userid)), 0, None)
    if r:
        return date_to_timestamp(r.timeStamp)
    return None

def getData(userid,start,end):
    return dbconn.query("select * from user_data where userid=$userid and timeStamp between $start and $end",vars=dict(userid=userid,start=start,end=end))


def multiple_insert_train(vs):
    a = dbconn.multiple_insert("user_train_data", vs)


def getTrainData(userid,start,end):
    return dbconn.query("select * from user_train_data where userid=$userid and userCyclingTimeStamp between $start and $end",vars=dict(userid=userid,start=start,end=end))


def get_rank(userid):
    rs = dbconn.query("""
        select userid,max(userCyclingStamina) as max_stamina from user_train_data
        where userCyclingTimeStamp > $sunday 
        group by userid
        order by max(userCyclingStamina) desc
    """,vars=dict(sunday=get_last_Sunday()))
    rank = 1
    for r in rs:
        print type(r.userid)
        print type(userid)
        if r.userid == userid:
            print "==========="
            return {"rank":rank,"userCyclingStamina":r.max_stamina}
        rank += 1


def get_ranks(start,end):
    rs = dbconn.query("""
        select username,max(userCyclingStamina) as max_stamina from user_train_data ut
            join user_info ui
            on ui.userid = ut.userid
        where userCyclingTimeStamp > $sunday
        group by ut.userid
        order by max(userCyclingStamina) desc
        limit $start,$n
    """,
        vars = dict(start=(start-1),n=(end-start+1),sunday=get_last_Sunday())
    )
    l = list()
    for r in rs:
        l.append({"username":r.username,"rank":start,"stamina":r.max_stamina})
        start += 1
    return l 

