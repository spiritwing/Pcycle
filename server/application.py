#!/usr/bin/python
#coding:utf-8

import web

urls = (
    "/","controllers.data.test",
    "/version","controllers.data.version",
    "/user","controllers.user.user_ctrl",
)


app = web.application(urls,globals())
application = app.wsgifunc()
