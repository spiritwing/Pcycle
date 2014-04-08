#!/usr/bin/python
#coding:utf-8
import os,time,web,itertools
from settings import dbconn,session_secret_key,password_key
from datetime import datetime
try:
    import hashlib
    sha1 = hashlib.sha1
except ImportError:
    import sha
    sha1 = sha.new


def safestr(obj, encoding='utf-8'):
    r"""
    Converts any given object to utf-8 encoded string. 
    
        >>> safestr('hello')
        'hello'
        >>> safestr(u'\u1234')
        '\xe1\x88\xb4'
        >>> safestr(2)
        '2'
    """
    if isinstance(obj, unicode):
        return obj.encode(encoding)
    elif isinstance(obj, str):
        return obj
    elif hasattr(obj, 'next'): # iterator
        return itertools.imap(safestr, obj)
    else:
        return str(obj)

def get_session(session_id):
    res = dbconn.query("select * from sessions where session_id = $session_id",vars=dict(session_id=session_id))
    return web.listget(res,0,None)

def getUserId(session_id):
    session = get_session(session_id)
    if not session:
        return None
    userid = session.data
    return userid

def createSessionId():
    while True:
        rand = os.urandom(16)
        now = time.time()
        session_id = sha1("%s%s%s%s" %(rand, now, safestr(web.ctx.ip), session_secret_key))
        session_id = session_id.hexdigest()
        if not get_session(session_id):
            break
    return session_id


def createSession(userid):
    session_id = createSessionId()
    dbconn.delete("sessions",where="data=$userid",vars=dict(userid=userid))
    dbconn.insert("sessions",
        session_id=session_id,
        data = userid 
    )
    return session_id


def date_to_timestamp(dt):
    return time.mktime(dt.timetuple())

def timestamp_to_date(ts):
    return datetime.fromtimestamp(ts)

def encode_password(password):
    return sha1(password + password_key).hexdigest()

def is_ascii(s):
    return all(ord(c) < 128 for c in s)
