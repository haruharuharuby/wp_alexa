# -*- coding: utf-8 -*-

from __future__ import print_function

import boto3
import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

sns = boto3.resource("sns")

"<<replaced>> topic_names_constants"

"<<replaced>> publish_to_specified_topic"


def publish(topic, message):
    logger.info(topic)
    topic_arn = sns.create_topic(Name=topic).arn
    subject = '[PUBLISH_TO_SNS]'
    msg = message
    if isinstance(message, dict):
        msg = json.dumps(message)

    sns.Topic(topic_arn).publish(
        Subject=subject,
        Message=msg
    )
