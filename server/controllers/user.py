#!/usr/bin/python
#coding:utf-8

import web,json
import models.users
from datetime import datetime
from helpers.utils import createSession,getUserId

class user_ctrl:
    def GET(self):
        data = web.input()
        if not data.has_key("sessionId") and not data.has_key("userName"):
            return web.notfound()
        user = None
        if data.has_key("sessionId"):
            userid = getUserId(data.sessionId)
            user = models.users.getUserByID(userid)
        """
            注意：用username获取用户有安全隐患，最好注册时输下密码，这样再返回sessionid比较合适
        """
        if not user:
            if data.has_key("userName"):
                user = models.users.getUserByUsername(data.userName)
        if user:
            return json.dumps({
                "userName": user.userName,
                "userPhoneNumber": user.userPhoneNumber,
                "userWeight": user.userWeight,
                "userHeight": user.userHeight,
                "userAge": user.userAge,
                "userMaxStamina": user.userMaxStamina,
                "userMaxStaminaTimeStamp": user.userMaxStaminaTimeStamp,
                "userLastStamina": user.userLastStamina,
                "userTotalMileage": user.userTotalMileage,
                "userFrontalArea": user.userFrontalArea,
                "userMaxSpeed": user.userMaxSpeed,
                "userMaxSpeedTimeStamp": user.userMaxSpeedTimeStamp,
                "userMaxPower": user.userMaxPower,
                "userMaxPowerTimeStamp": user.userMaxPowerTimeStamp 
            })
        else:
            return json.dumps({"errorcode":1001})


    def POST(self):
        data = web.input() 
        if not data.has_key("type"):
            return web.notfound()

        if data.type == "new":
            ##必填项判断
            if not data.has_key("userName"):
                return json.dumps({"error":1001})
            userName = data.userName
            if models.users.hasUserName(userName):
                return json.dumps({"error":1002})
            ##选填项
            userWeight,userHeight,userAge,userPhoneNumber = None,None,None,None
            try:
                userWeight = int(data.userWeight)
                userHeight = int(data.userHeight)
                userAge = int(data.userAge)
                userPhoneNumber = data.userPhoneNumber
            except:
                pass

            userid = models.users.create(
                userName = userName,
                userWeight = userWeight,
                userHeight = userHeight,
                userAge = userAge,
                userPhoneNumber = userPhoneNumber,
                )

            sessionId = createSession(userid = userid)
            return json.dumps({"sessionId":sessionId , "code":1})

        elif data.type == "update":
            if not data.has_key("sessionId"):
                return json.dumps({"errorCode":1001})
            userid = getUserId(data.sessionId)
            if not userid:
                return json.dumps({"errorCode":1001})
            u_dict = dict()
            """
            if data.has_key("userName") and data.userName:
                u_dict.update({"userName":data.userName})
            """
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


