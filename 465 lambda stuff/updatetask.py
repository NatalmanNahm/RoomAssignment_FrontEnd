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
    newname = event.get('newname', None)
    cost = event.get('ttc', None)
    instock = event.get('iscompleted', None)
    room = event.get('room', None)
    
    
    itemcheck = dynamo.scan(
        FilterExpression=Attr('id').eq(name)
        )
    if itemcheck['Count'] == 0:
        r = {"404":"Task not found."}
        return(r)


    if not newname is None:
        dynamo.update_item(
            Key={
                'id': name
            },
            UpdateExpression="set taskname=:t",
            ExpressionAttributeValues={
                ':t': newname
            }
        )
    # else:
    #     uncheck = dynamo.scan(
    #         FilterExpression=Attr('taskname').eq(newname)
    #         )
    #     if uncheck['Count'] != 0:
    #         r = {"400":"New Task name is already in use."}
    #         return(r)

    if not cost is None:
        newcost = json.loads(json.dumps(cost), parse_float=Decimal)
        dynamo.update_item(
            Key={
                'id': name
            },
            UpdateExpression="set ttc=:p",
            ExpressionAttributeValues={
                ':p': newcost
            }
        )

    if not instock is None:
        dynamo.update_item(
            Key={
                'id': name
            },
            UpdateExpression="set iscompleted=:p",
            ExpressionAttributeValues={
                ':p': instock
            }
        )

    if not room is None:
        dynamo.update_item(
            Key={
                'id': name
            },
            UpdateExpression="set room=:p",
            ExpressionAttributeValues={
                ':p': room
            }
        )

    response = dynamo.scan(
        FilterExpression=Attr('id').eq(name)
        )
    return response['Items']