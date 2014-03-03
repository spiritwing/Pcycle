#!/usr/bin/python
#coding:utf-8

import web,json
from settings import current_version


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


class traindata:
    def GET(self):
        data = web.input()
        sessionId = data.sessionId
