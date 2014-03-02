#!/usr/bin/python
#coding:utf-8
import web

current_version = 0.1


dbconn = web.database(dbn='mysql', user="swing", host="112.124.69.180", db="pcycle",pw="swing123")
session_secret_key = "sffsjflooemf"
