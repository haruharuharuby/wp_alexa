# -*- coding: utf-8 -*-

from __future__ import print_function

import boto3
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

s3 = boto3.resource("s3")

"<<replaced>> publish_to_specified_bucket"


def get(bucket_name, key):
    obj = s3.Object(bucket_name, key)
    response = obj.get()
    body = response['Body'].read()
    return body


def put(bucket_name, key, data):
    bucket = s3.Bucket(bucket_name)
    obj = bucket.put_object(Key=key, Body=data)
    return obj
