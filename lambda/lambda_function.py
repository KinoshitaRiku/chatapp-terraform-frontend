from __future__ import print_function

import boto3
import time

def lambda_handler(event, context):
  path = "/"
  for items in event["Records"]:
    if path in items["s3"]["object"]["key"]:
      client = boto3.client('cloudfront')
      invalidation = client.create_invalidation(DistributionId='YOUR_DISTRIBUTION_ID',
        InvalidationBatch={
          'Paths': {
            'Quantity': 1,
            'Items': [path + '/*']
        },
        'CallerReference': str(time.time())
      })
      break

####################################

# from __future__ import print_function

# import boto3
# import json
# import time

# cp = boto3.client('codepipeline')
# cf = boto3.client('cloudfront')

# # codepipelineへ成功jobを返答する
# def put_job_success(job_id):
#   cp.put_job_success_result(jobId=job_id)

# # codepipelineへ失敗jobを返答する
# def put_job_failure(job_id, err):
#   message = 'Function exception: ' + str(err)
#   cp.put_job_failure_result(
#     jobId=job_id,
#     failureDetails={
#       'type': 'JobFailed',
#       'message': message
#     }
#   )

# # lambdaのmain関数
# def lambda_handler(event, context):
#   try:
#     job_id = event['CodePipeline.job']['id']
#     job_data = event['CodePipeline.job']['data']

#     user_parameters = json.loads(
#       job_data['actionConfiguration']['configuration']['UserParameters']
#     )
        
#     distribution_id = user_parameters['DistributionId']
    
#     res = cf.create_invalidation(
#       DistributionId=distribution_id,
#       InvalidationBatch={
#       'Paths': {
#           'Quantity': 1,
#           'Items': ['/*'],
#       },
#       'CallerReference': str(time.time())
#       }
#     )
#     put_job_success(job_id)
  
#   except Exception as err:
#     put_job_failure(job_id, err)
      
#   return "Complete."