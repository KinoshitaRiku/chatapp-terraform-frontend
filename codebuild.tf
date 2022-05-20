# resource "aws_codebuild_project" "frontend" {
#   name         = "chatapp-frontend-codebuild"
#   service_role = aws_iam_role.codebuild_role.arn
 
#   artifacts {
#     type = "NO_ARTIFACTS"
#   }
 
#   environment {
#     compute_type                = "BUILD_GENERAL1_SMALL"
#     image                       = "aws/codebuild/standard:5.0"
#     type                        = "LINUX_CONTAINER"
#     image_pull_credentials_type = "CODEBUILD"
#     privileged_mode             = true
 
#     environment_variable {
#       name  = "AWS_DEFAULT_REGION"
#       value = "ap-northeast-1"
#     }
 
#     environment_variable {
#       name  = "IMAGE_TAG"
#       value = "latest"
#     }
#   }
 
#   source {
#     type            = "GITHUB"
#     git_clone_depth = 1
#     location        = "https://github.com/KinoshitaRiku/nuxtjs-api-chatapp.git"
    
#     buildspec       = "buildspec.yml"
#   }
# }