from __future__ import print_function

import boto3
import json
import hashlib
import os
import uuid
from boto3.dynamodb.conditions import Key, Attr

print('Loading function')

def lambda_handler(event, context):

    dynamo = boto3.resource('dynamodb').Table('finalItems')

    if not event.get('id') is None:
        tryitem = event.get('id')
        getitem = dynamo.scan(
            FilterExpression=Attr('id').eq(tryitem)
        )
        if not getitem['Count'] is 0:
            getitemcont = getitem.get('Items')
            response = []
            for each in getitem['Items']:
                response.append(each)
            return (getitemcont)
        else:
            resp = {"404":"Task not found."}
            return (resp)
    
    else:
        getall = dynamo.scan()
        response = []
        for each in getall['Items']:
            response.append(each)
        return response