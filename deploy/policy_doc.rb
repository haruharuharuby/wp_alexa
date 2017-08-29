require 'json'
require 'aws-sdk'
require 'securerandom'
require './aws_adapter.rb'

module PolicyDoc

  def policy_template
    template = {}
    template["Version"] = "2012-10-17"
    template["Statement"] = []
    template
  end

  def assume_role_policy_doc
    {
      Version:"2012-10-17",
      Statement:[{Effect:"Allow",Principal:{ Service:"lambda.amazonaws.com" }, Action:"sts:AssumeRole"}]
    }
  end

  def s3_policy_doc(bucket_arns)
    s3 = {}
    s3["Sid"] = SecureRandom.hex(16)
    s3["Effect"] = "Allow"
    s3["Action"] = ["s3:ListBucket", "s3:GetObject"]
    s3["Resource"] = bucket_arns
    s3
  end

  def sns_policy_doc(topic_arns, region="ap-northeast-2")
    sns = {}
    sns["Sid"] = SecureRandom.hex(16)
    sns["Effect"] = "Allow"
    sns["Action"] = ["sns:CreateTopic", "sns:Publish"]
    sns["Resource"] = topic_arns
    sns
  end

  def dynamo_policy_doc(table_arns, region="ap-northeast-2")
    dynamo = {}
    dynamo["Sid"] = SecureRandom.hex(16)
    dynamo["Effect"] = "Allow"
    dynamo["Action"] = ["dynamodb:DeleteItem", "dynamodb:Query", "dynamodb:PutItem", "dynamodb:UpdateItem"]
    dynamo["Resource"] = table_arns
    dynamo
  end

  def sqs_policy_doc(queue_arns, region="ap-northeast-2")
    sqs = {}
    sqs["Sid"] = SecureRandom.hex(16)
    sqs["Effect"] = "Allow"
    sqs["Action"] = ["sqs:GetQueueAttributes", "sqs:GetQueueUrl", "sqs:SendMessage", "sqs:DeleteMessage", "sqs:ReceiveMessage"]
    sqs["Resource"] = queue_arns
    sqs
  end

  def sns_lambda_permission(lambda_function_name, topic_arn)
    sns = {}
    sns[:function_name] = lambda_function_name
    sns[:statement_id] = SecureRandom.hex(16)
    sns[:action] = "lambda:InvokeFunction"
    sns[:principal] = "sns.amazonaws.com"
    sns[:source_arn] = topic_arn
    sns
  end

  def s3_lambda_permission(lambda_function_name, s3_arn)
    s3 = {}
    s3[:function_name] = lambda_function_name
    s3[:statement_id] = SecureRandom.hex(16)
    s3[:action] = "lambda:InvokeFunction"
    s3[:principal] = "s3.amazonaws.com"
    s3[:source_arn] = s3_arn
    s3
  end
end
