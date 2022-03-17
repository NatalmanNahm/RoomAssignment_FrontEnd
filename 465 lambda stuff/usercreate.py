from __future__ import print_function

import boto3
import json
import hashlib
import os
import uuid
import datetime
from boto3.dynamodb.conditions import Key, Attr

print('Loading function')

def lambda_handler(event, context):

    operation = 'create'
    dynamo = boto3.resource('dynamodb').Table('finalUsers')

    user = event.get('username', None)
    passw = event.get('password', None)
    fname = event.get('fname', None)
    lname = event.get('lname', None)
    email = event.get('email', None)
    age = event.get('age', None)
    userid = str(uuid.uuid4())
    dt = datetime.datetime.now()
    curDate = json.dumps(dt, indent=4, sort_keys=True, default=str)

    
    if user is None:
        ex = {"400":"Please provide a username."}
        return ex
    if passw is None:
        ex ={"400":"Please provide a password."}
        return ex
    if fname is None:
        ex ={"400":"Please provide a first name."}
        return ex
    if lname is None:
        ex ={"400":"Please provide a last name."}
        return ex
    if email is None:
        ex ={"400":"Please provide an email."}
        return ex
    if age is None:
        ex ={"400":"Please provide an age."}
        return ex        
    pwhash = hashlib.sha256(passw.encode()).hexdigest()
    
    uncheck = dynamo.scan(
        FilterExpression=Attr('username').eq(user)
        )
    if uncheck['Count'] is 0:
        dynamo.put_item(
            Item={
                "id": userid,
                "username": user,
                "password": pwhash,
                "first_name": fname,
                "last_name": lname,
                "email": email,
                "registerdate": curDate,
                "age": age
            }
            )
        resp ={"200":"Successfully signed up."}
        return resp
    else:
        resp ={"400":"User Already exists."} 
        return resp 