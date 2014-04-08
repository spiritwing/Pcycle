#!/usr/bin/python
#coding:utf-8
import random,zlib,json
from datetime import datetime
from helpers.utils import date_to_timestamp,timestamp_to_date
"""
names = (
"userName" ,"userPhoneNumber" ,"userWeight" ,"userHeight" ,"userAge" ,"userMaxStamina" ,"userMaxStaminaTimeStamp" ,"userLastStamina" ,"userTotalMileage" ,"userFrontalArea" ,"userMaxSpeed" ,"userMaxSpeedTimeStamp" ,"userMaxPower" ,"userMaxPowerTimeStamp" )
data = ""
for name in names:
    data += '"' + name + '": user.' + name +',\n'

print data

f = open("test.data","w")
f.write(data)
f.close()

data_ziped = zlib.compress(data,9) 

f = open("test.gzip","w")
f.write(data_ziped)
f.close()
"""
import urllib
import urllib2

local_mode = 0

url = "http://127.0.0.1:3030" if local_mode else "http://app.pcycle.com"

def register():
    global url
    url += '/register'
    values = {"email":"swing@qq.com","password":"swing123" }

    data = urllib.urlencode(values)
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print the_page


def login():
    global url
    url += '/login'
    values = {"email":"thirtyjohn@hh.com","password":"a1122333" }

    data = urllib.urlencode(values)
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print the_page


def update_user():
    global url
    url += '/user'
    values = {"sessionId":"3ed21ab26d3423c8d38a5674847e6b58563b70cf","userName":"thirtyjohn", "userPhoneNumber":"18602113130" ,"userWeight":65 ,"userHeight":176 ,"userAge":27 }

    data = urllib.urlencode(values)
    req = urllib2.Request(url, data)
    response = urllib2.urlopen(req)
    the_page = response.read()
    print the_page


def get_user():
    global url
    url += "/user?sessionId=3ed21ab26d3423c8d38a5674847e6b58563b70cff"
    print urllib2.urlopen(url).read()


def multi_data():
    sessionId = "3ed21ab26d3423c8d38a5674847e6b58563b70cf"
    l = list()
    for i in range(0,3600):
        l.append({'speed':random.uniform(1, 100), 'power':random.uniform(1, 100), 'timeStamp':date_to_timestamp(datetime.now()), 'longitude':random.uniform(1, 100), 'latitude':random.uniform(1, 100), 'altitude':random.uniform(1, 100), 'climbHeight':random.uniform(1, 100), 'distance':random.uniform(1, 100), 'gradient':random.uniform(1, 100)})
    d = dict(data=l)
    j = json.dumps(d)
    data_ziped = zlib.compress(j,9)
    f = open(sessionId,"w")
    f.write(data_ziped)
    f.close()
    print "******************"
    print datetime.now()
    global url
    url += '/data'
    ##values = {"data":data_ziped,"sessionId":"d39f7be1ad2cd3d199e9afedf39f5bd8199026b6" }

    from poster.encode import multipart_encode
    from poster.streaminghttp import register_openers

    register_openers()
    datagen, headers = multipart_encode({"datafile": open(sessionId, "rb")})
    request = urllib2.Request(url, datagen, headers)
    print urllib2.urlopen(request).read()
    print datetime.now()
    print "******************"



def get_multi_data():
    global url
    ##url += "/user?sessionId=b1d5c2781515176c2a4024afd1f152af04d52f50"
    url += "/data?sessionId=3ed21ab26d3423c8d38a5674847e6b58563b70cf&startStamp=1396929800&endStamp=1396929910"
    d = urllib2.urlopen(url).read()
    print json.loads(zlib.decompress(d))



register()
