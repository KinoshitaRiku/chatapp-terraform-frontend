resource "aws_lambda_function" "cloudfront" {
  filename      = data.archive_file.function_source.output_path
  function_name = "lambda_cloudfront"
  role          = aws_iam_role.lambda_cloudfront_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime = "python3.8"
  source_code_hash = data.archive_file.function_source.output_base64sha256

}

data "archive_file" "function_source" {
  type        = "zip"
  source_dir  = "lambda"
  output_path = "archive/lambda_function.zip"
}