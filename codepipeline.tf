# resource "aws_codepipeline" "frontend" {
#   name     = "chatapp-frontend"
#   role_arn = aws_iam_role.codepipeline_role.arn

#   artifact_store {
#     location = aws_s3_bucket.frontend_artifact.bucket
#     type     = "S3"
#   }

#   stage {
#     name = "Source"

#     action {
#       name             = "Source"
#       category         = "Source"
#       owner            = "AWS"
#       provider         = "CodeStarSourceConnection"
#       version          = "1"
#       output_artifacts = ["source_output"]
#       configuration = {
#         BranchName = "main"
#         ConnectionArn = var.github_connection_arn
#         FullRepositoryId = "KinoshitaRiku/nuxtjs-api-chatapp"
#         OutputArtifactFormat = "CODEBUILD_CLONE_REF"
#       }
#     }
#   }

#   stage {
#     name = "Build"

#     action {
#       name            = "Build"
#       category        = "Build"
#       owner           = "AWS"
#       provider        = "CodeBuild"
#       input_artifacts = ["source_output"]
#       output_artifacts = ["build_output"]
#       version         = "1"

#       configuration = {
#         ProjectName = aws_codebuild_project.frontend.name
#       }
#     }
#   }

#   stage {
#     name = "Deploy"
 
#     action {
#       name            = "Deploy"
#       category        = "Deploy"
#       owner           = "AWS"
#       provider        = "S3"
#       input_artifacts = ["build_output"]
#       version         = "1"
 
#       configuration = {
#         BucketName = aws_s3_bucket_policy.frontend.id
#         Extract = "true"
#       }
#     }
#   }

#   stage {
#     name = "Invalidation"
 
#     action {
#       name            = "Invalidation"
#       category        = "Invoke"
#       owner           = "AWS"
#       provider        = "Lambda"
#       version         = "1"
 
#       configuration = {
#         FunctionName = aws_lambda_function.cloudfront.id
#         UserParameters = jsonencode({
#                 "DistributionId" = aws_cloudfront_distribution.frontend.id
#       })
#       }
#     }
#   }
# }

# resource "aws_s3_bucket" "frontend_artifact" {
#   # variable
#   bucket = "rk-self-introduction-artifact"
#   acl    = "private"
# }