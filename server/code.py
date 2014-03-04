#!/usr/bin/env python
#coding:utf-8
import web



urls = (
    "/","controllers.data.test",
    "/version","controllers.data.version",
    "/user","controllers.user.user_ctrl",
    "/data","controllers.data.data_pack",
)

app = web.application(urls,globals())
if __name__ == "__main__":
    app.run()


