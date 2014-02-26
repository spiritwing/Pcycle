#!/usr/bin/env python
#coding:utf-8
import web



urls = (
    "/","controllers.data.test",    
)

app = web.application(urls,globals())
if __name__ == "__main__":
    app.run()


