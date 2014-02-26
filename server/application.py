#!/usr/bin/python
#coding:utf-8

import web

urls = (
    "/","controllers.data.test",    
)


app = web.application(urls,globals())
application = app.wsgifunc()
