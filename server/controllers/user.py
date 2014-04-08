#!/usr/bin/python
#coding:utf-8

import web,json
import models.users
from datetime import datetime
from helpers.utils import createSession,getUserId,encode_password,is_ascii

class info:
    def GET(self):
        data = web.input()
        if not data.has_key("sessionId"):
            return web.notfound()
        user = None
        if data.has_key("sessionId"):
            userid = getUserId(data.sessionId)
            user = models.users.getUserByID(userid)
        if user:
            return json.dumps({
                "userName": user.userName,
                "userPhoneNumber": user.userPhoneNumber,
                "userWeight": user.userWeight,
                "userHeight": user.userHeight,
                "userAge": user.userAge, 
            })
        else:
            return json.dumps({"errorcode":1001})


    def POST(self):
        data = web.input() 
        if not data.has_key("sessionId"):
            return json.dumps({"code":0 ,"errorCode":1001})
        userid = getUserId(data.sessionId)
        if not userid:
            return json.dumps({"code":0 ,"errorCode":1001})
        u_dict = dict()
        if data.has_key("userName") and data.userName:
            u_dict.update({"userName":data.userName})
        if data.has_key("userWeight") and data.userWeight:
            u_dict.update({"userWeight":int(data.userWeight)})
        if data.has_key("userHeight") and data.userHeight:
            u_dict.update({"userHeight":int(data.userHeight)})
        if data.has_key("userAge") and data.userAge:
            u_dict.update({"userAge":int(data.userAge)})
        if data.has_key("userPhoneNumber") and data.userPhoneNumber:
            u_dict.update({"userPhoneNumber":data.userPhoneNumber})
        if models.users.update(userid,u_dict):
            return json.dumps({"code":1})
        return json.dumps({"code":0})

class register:
    def POST(self):
        data = web.input()
        if not data.has_key("email") or not data.has_key("password"):
            return web.notfound()
        email = data.email.strip() if data.email else None
        password = data.password.strip() if data.password else None
        if not email or not password \
                or email == "" or password == "" \
                or not is_ascii(email) or not is_ascii(password):
            return json.dumps({"code":0 ,"errorCode":1005})
        if models.users.getUserByEmail(email):
            return json.dumps({"code":0 ,"errorCode":1004}) 
        password =  encode_password(password)
        userid = models.users.create(
                email = email,
                password = password
                )
        sessionId = createSession(userid = userid)
        return json.dumps({"sessionId":sessionId , "code":1})

class login:
    def POST(self):
        data = web.input()
        data = web.input()
        if not data.has_key("email") or not data.has_key("password"):
            return web.notfound()
        email = data.email.strip() if data.email else None
        password = data.password.strip() if data.password else None
        if not email or not password \
                or email == "" or password == "" \
                or not is_ascii(email) or not is_ascii(password):
            return json.dumps({"code":0 ,"errorCode":1005})
        password =  encode_password(password)
        user = models.users.getUserByEmail(email)
        if not user:
            return json.dumps({"code":0,"errorCode":1006})
        if password <> user.password:
            return json.dumps({"code":0,"errorCode":1007})
        sessionId = createSession(userid = user.userid)
        return json.dumps({"sessionId":sessionId , "code":1})


class rank:
    def GET(self):
        data = web.input()
        if not data.has_key("sessionId"):
            return web.notfound()
        userid = getUserId(data.sessionId)
        user = models.users.getUserByID(userid)
        if not user:
            return json.dumps({"errorcode":1001})
        """
            需要一个汇总表，记录每个人的汇总记录
        """
        ranks = models.users.getRanks(data.start,data.end)
        user_rank = models.users.getRank(user.userid)
        return json.dumps({"rank":user_rank,"ranks":ranks})


class feedback:
    def POST(self):
        data = web.input()
        if not data.has_key("sessionId"):
            return web.notfound()
        userid = getUserId(data.sessionId)
        user = models.users.getUserByID(userid)
        if not user:
            return json.dumps({"errorcode":1001})
        
