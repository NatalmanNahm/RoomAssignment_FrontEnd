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
    newuser = event.get('newusername', None)
    passw = event.get('password', None)
    fname = event.get('fname', None)
    lname = event.get('lname', None)
    email = event.get('email', None)
    
    
    usercheck = dynamo.scan(
        FilterExpression=Attr('username').eq(user)
        )
    if usercheck['Count'] == 0:
        r = {"404":"User not found."}
        return(r)

    if newuser is None:
        newuser = user
    else:
        uncheck = dynamo.scan(
            FilterExpression=Attr('username').eq(newuser)
            )
        if uncheck['Count'] != 0:
            r = {"400":"New username is already in use."}
            return(r)
        
        logid = loginTable.scan(
            ProjectionExpression = 'id',
            FilterExpression=Attr('username').eq(user)
            )
        try2 = json.dumps(logid['Items'])
        try3 = try2.replace('\"id\":', '')
        try4 = try3.replace('[{ \"', '')
        try5 = try4.replace('\"}]', '')
        
        loginTable.update_item(
            Key={
                'id': try5
            },
            UpdateExpression="set username=:r",
            ExpressionAttributeValues={
                ':r': newuser
            }
            )

    if fname is None:
        tryuser = dynamo.scan(
        ProjectionExpression = 'first_name',
        FilterExpression=Attr('username').eq(user)
        )
        try2 = json.dumps(tryuser['Items'])
        try3 = try2.replace('\"first_name\":', '')
        try4 = try3.replace('[{ \"', '')
        try5 = try4.replace('\"}]', '')
        try6 = try5.replace('[{', '')
        fname = try6.replace('}]', '')
        if fname == "":
            fname = None

    if lname is None:
        tryuser = dynamo.scan(
        ProjectionExpression = 'last_name',
        FilterExpression=Attr('username').eq(user)
        )
        try2 = json.dumps(tryuser['Items'])
        try3 = try2.replace('\"last_name\":', '')
        try4 = try3.replace('[{ \"', '')
        try5 = try4.replace('\"}]', '')
        try6 = try5.replace('[{', '')
        lname = try6.replace('}]', '')
        if lname == "":
            lname = None

    if email is None:
        tryuser = dynamo.scan(
        ProjectionExpression = 'email',
        FilterExpression=Attr('username').eq(user)
        )
        try2 = json.dumps(tryuser['Items'])
        try3 = try2.replace('\"email\":', '')
        try4 = try3.replace('[{ \"', '')
        try5 = try4.replace('[{', '')
        try6 = try5.replace('}]', '')
        try7 = try6.replace('\"}]', '')
        email = try7.replace('"', '')
        if email == "":
            email = None

    
    tryuser = dynamo.scan(
        ProjectionExpression = 'id',
        FilterExpression=Attr('username').eq(user)
    )
    try2 = json.dumps(tryuser['Items'])
    try3 = try2.replace('\"id\":', '')
    try4 = try3.replace('[{ \"', '')
    try5 = try4.replace('\"}]', '')


    dynamo.update_item(
        Key={
            'id': try5
        },
        UpdateExpression="set username=:r, first_name=:p, last_name=:a, email=:q",
        ExpressionAttributeValues={
            ':r': newuser,
            ':p': fname,
            ':a': lname,
            ':q': email
        }
    )
    response = dynamo.scan(
        FilterExpression=Attr('username').eq(newuser)
        )
    return response['Items']