require 'aws-sdk'

class AwsAdapter
  attr_reader :iam, :lambda_client, :sns, :sts, :ec2, :sqs, :dynamo, :s3

  # 本番環境(東京リージョン）に間違ってデプロイしないよう、デフォルトはステージング環境であるソウルにしておく。
  def initialize(region="ap-northeast-2")
    @iam = Aws::IAM::Resource.new(client: Aws::IAM::Client.new(region: region))
    @lambda_client = Aws::Lambda::Client.new(region: region)
    @sns = Aws::SNS::Resource.new(client: Aws::SNS::Client.new(region: region))
    @sts = Aws::STS::Client.new(region: region)
    @sqs = Aws::SQS::Client.new(region: region)
    @ec2 = Aws::EC2::Resource.new(Aws::EC2::Client.new(region: region))
    @dynamo = Aws::DynamoDB::Client.new(region: region)
    @s3 = Aws::S3::Resource.new(client: Aws::S3::Client.new(region: region))
  end
end
