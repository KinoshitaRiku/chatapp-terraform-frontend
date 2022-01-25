resource "aws_s3_bucket" "frontend" {
  # variable
  bucket = "rk-self-introduction"
  acl    = "private"
}

resource "aws_s3_bucket_policy" "frontend" {
    bucket = aws_s3_bucket.frontend.id
    policy = data.aws_iam_policy_document.frontend_policy.json
}

data "aws_iam_policy_document" "frontend_policy" {
  statement {
    sid = "Allow CloudFront"
    effect = "Allow"
    principals {
        type = "AWS"
        identifiers = [aws_cloudfront_origin_access_identity.frontend_identity.iam_arn]
    }
    actions = [
        "s3:GetObject"
    ]

    resources = [
        "${aws_s3_bucket.frontend.arn}/*"
    ]
  }
}