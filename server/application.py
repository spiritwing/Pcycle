#!/usr/bin/python
#coding:utf-8

import web

urls = (
    "/version","controllers.data.version",
    "/user","controllers.user.info",
    "/register","controllers.user.register",
    "/login","controllers.user.login",
    "/data","controllers.data.data_pack",
    "/train","controllers.data.data_train",
    "/rank","controllers.data.rank",
)


app = web.application(urls,globals())
application = app.wsgifunc()
