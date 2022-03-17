from __future__ import print_function

import boto3
import json
import hashlib
import os
import uuid
import datetime
from decimal import Decimal
from boto3.dynamodb.conditions import Key, Attr

print('Loading function')

def lambda_handler(event, context):

    itemTable = boto3.resource('dynamodb').Table('finalItems')

    name = event.get('taskname', None)
    ttc = event.get('ttc', None)
    room = event.get('room', None)
    iscompleted = event.get('iscompleted', None)
    taskid = str(uuid.uuid4())

    if name is None:
        ex = {"400":"Please provide a task name."}
        return ex
    if room is None:
        ex = {"400":"Please provide a room number."}
        return ex
    if ttc is None:
        ex ={"400":"Please provide an estimated time for completion."}
        return ex
    if iscompleted is None:
        ex ={"400":"Please provide a task's completion status."}
        return ex
    newcost = json.loads(json.dumps(ttc), parse_float=Decimal)
    uncheck = itemTable.scan(
        FilterExpression=Attr('taskname').eq(name)
        )
    if uncheck['Count'] is 0:
        itemTable.put_item(
            Item={
                "id": taskid,
                "taskname": name,
                "ttc": newcost,
                "room": room,
                "iscompleted": iscompleted
            }
            )
        resp ={"200":"Successfully added task."}
        return resp
    else:
        resp ={"400":"task already exists."} 
        return resp 