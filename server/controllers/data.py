#!/usr/bin/python
#coding:utf-8

import web,json,zlib
from settings import current_version
from datetime import datetime
from helpers.utils import getUserId,date_to_timestamp,timestamp_to_date
import models.datas



class test:
    def GET(self):
        return "hello pcycle!"


class version:
    def GET(self):
       return json.dumps({"version":current_version})
"""
        data = web.input()
        if not data.has_key("version"):
            return web.notfound()
        try:
            ver = float(data.version)
            if ver < current_version:
                return json.dumps({"state":0,"version":current_version})
            else:
                return json.dumps({"state":1})
        except:
            return web.notfound()
"""


class data_pack:
    def POST(self):
        data = web.input(datafile={})
        """
        if not data.has_key("sessionId") or not data.sessionId:
            return web.notfound()
        """
        sessionId = data['datafile'].filename
        userid = getUserId(sessionId)
        if not userid:
            return json.dumps({"errorCode":1001})
        data_compressed = None
        try:
            data_compressed = zlib.decompress(data['datafile'].value)
        except:
            return json.dumps({"errorCode":1003})
        data_json = json.loads(data_compressed)["data"]
        for d in data_json:
            d.update({"userid":userid,"timeStamp":timestamp_to_date(d["timeStamp"])})
        r = models.datas.multiple_insert(data_json)
        last_timestamp = models.datas.getLastTimeStamp(userid)
        if r:
            return json.dumps({"code":1,"last_timestampe":last_timestamp})
        else:
            return json.dumps({"code":0,"last_timestampe":last_timestamp})


    def GET(self):
        data = web.input()
        if not data.has_key("sessionId") or not data.sessionId \
            or not data.has_key("startStamp") or not data.startStamp \
            or not data.has_key("endStamp") or not data.endStamp:
            return web.notfound()
        userid = getUserId(data.sessionId)
        if not userid:
            return json.dumps({"errorCode":1001})
        l = list()
        user_datas = models.datas.getData(userid,timestamp_to_date(float(data.startStamp)),timestamp_to_date(float(data.endStamp)))
        for user_data in user_datas:
            user_data.timeStamp = date_to_timestamp(user_data.timeStamp)
            del user_data["userid"]
            del user_data["ID"]
            l.append(user_data)
        return zlib.compress(json.dumps({"data":l}))

        
