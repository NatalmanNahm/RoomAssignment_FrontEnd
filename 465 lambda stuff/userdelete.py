from __future__ import print_function

import boto3
import json
import hashlib
import os
import uuid
from boto3.dynamodb.conditions import Key, Attr

print('Loading function')

def lambda_handler(event, context):

    dynamo = boto3.resource('dynamodb').Table('finalUsers')
    loginTable = boto3.resource('dynamodb').Table('finalLogin')
    user = event.get('username', None)
    
    logCheck = dynamo.scan(
        FilterExpression=Attr('username').eq(user)
        )
    if logCheck['Count'] != 0:
        
        tryuser = dynamo.scan(
        ProjectionExpression = 'id',
        FilterExpression=Attr('username').eq(user)
        )
        try2 = json.dumps(tryuser['Items'])
        try3 = try2.replace('\"id\":', '')
        try4 = try3.replace('[{ \"', '')
        userid = try4.replace('\"}]', '')
        
        dynamo.delete_item(
            Key={
                'id': userid
            }
            )
            
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
        r = {"200":"User successfully deleted."}
        return (r)
    else:
        r = {"404":"User not found."}
        return (r)


