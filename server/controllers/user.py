#!/usr/bin/python
#coding:utf-8

import web,json
import models.users
from datetime import datetime
from helpers.utils import createSessionId

user:
    userid, username , ....

user_session:
    userid sessionId

user_uuid:
    userid uuid




class get_user:
    def GET(self):
        data = web.input()
        if not data.has_key("sessionId") or not data.has_key("username"):
            return web.notfound()

        user = None
        if data.has_key("sessionId"):
            user = models.users.getUserBySessionId(data.sessionId)
        if not user:
            if data.has_key("username"):
                user = models.users.getUserByUsername(data.username)
        if user:
            return json.dumps(user)
        else:
            return json.dumps({"error":"invalid sessionId or username"})


class new_user:
    def POST(self):
        data = web.input()
        ##必填项判断
        if not data.has_key("username"):
            return json.dumps({"error":"userinfo not enough"})
        username = data.username
        ##选填项
        weight,height,age,frontalArea = None,None,None,None
        try:
            weight = int(data.weight)
            height = int(data.height)
            age = int(data.age)
            frontalArea = float(data.frontalArea)
        except:
            pass

        user = models.users.create("user",
            username = username,
            weight = weight,
            height = height,
            age = age,
            frontalArea = frontalArea,
            createdate = datetime.now()
        )

        sessionId = createSessionId()
        models.users.update(user,sessionId=sessionId)
        return json.dumps({"sessionId":sessionId})




