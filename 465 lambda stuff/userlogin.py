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

    dynamo = boto3.resource('dynamodb').Table('finalUsers')
    loginTable = boto3.resource('dynamodb').Table('finalLogin')

    user = event.get('username', None)
    passw = event.get('password', None)
    
    if user is None:
        r = {"400":"Please provide a username."}
        return(r)
    if passw is None:
        r = {"400":"Please provide a password."}
        return(r)
        
    pwhash = hashlib.sha256(passw.encode()).hexdigest()

    data1 = dynamo.scan(
        FilterExpression=Attr('username').eq(user)
    )
    if data1['Count'] is 0:
        r = {"404":"User does not exist."}
        return(r)
    pwcheck = dynamo.scan(
        FilterExpression=Attr('username').eq(user) & Attr('password').eq(pwhash)
    )
    if pwcheck['Count'] is 0:
        r = {"400":"Incorrect password."}
        return(r)
    else:
        loginid = str(uuid.uuid4())
        loginToken = hashlib.sha256(user.encode()).hexdigest()
        
        logincheck = loginTable.scan(
        FilterExpression=Attr('loginToken').eq(loginToken)
        )
        if not logincheck['Count'] is 0:
            tryuser2 = loginTable.scan(
            ProjectionExpression = 'id',
            FilterExpression=Attr('username').eq(user)
            )
            lg2 = json.dumps(tryuser2['Items'])
            lg3 = lg2.replace('\"id\":', '')
            lg4 = lg3.replace('[{ \"', '')
            loginid = lg4.replace('\"}]', '')
        
            loginTable.delete_item(
                Key={
                    'id': loginid
                }
                )
            r = {"200":"Successfully logged out."}
            return(r)
            
            
        login = loginTable.put_item(
            Item={
                "id": loginid,
                "username": user,
                "loginToken": loginToken
            }
            )
        newitem = {"200":"Successfully logged in.","token": loginToken}
        return newitem
