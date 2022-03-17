from __future__ import print_function

import boto3
import json
import hashlib
import os
import uuid
from decimal import Decimal
from boto3.dynamodb.conditions import Key, Attr

print('Loading function')

def lambda_handler(event, context):

    dynamo = boto3.resource('dynamodb').Table('finalItems')
    name = event.get('id', None)
    
    itemCheck = dynamo.scan(
        FilterExpression=Attr('id').eq(name)
        )
    if itemCheck['Count'] != 0:
        
        tryitem = dynamo.scan(
        ProjectionExpression = 'id',
        FilterExpression=Attr('taskname').eq(name)
        )
        try2 = json.dumps(tryitem['Items'])
        try3 = try2.replace('\"id\":', '')
        try4 = try3.replace('[{ \"', '')
        itemid = try4.replace('\"}]', '')
        
        dynamo.delete_item(
            Key={
                'id':name
            }
            )
            
        r = {"200":"Task successfully deleted."}
        return (r)
    else:
        r = {"404":"Task not found."}
        return (r)


