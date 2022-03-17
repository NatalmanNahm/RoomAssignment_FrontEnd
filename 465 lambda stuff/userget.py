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
    
    if not event.get('username') is None:
        tryuser = event.get('username')
        getuser = dynamo.scan(
            FilterExpression=Attr('username').eq(tryuser)
        )
        if not getuser['Count'] is 0:
            getuseritems = getuser.get('Items')
            response = []
            for item in getuser['Items']:
                response.append(item)
            return (getuser['Items'])
        else:
            resp = {"404":"User not found."}
            return (resp)
    
    else:
        getall = dynamo.scan()
        response = []
        for each in getall['Items']:
            response.append(each)
        return response