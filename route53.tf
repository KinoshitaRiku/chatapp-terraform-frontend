#未完成

resource "aws_route53_zone" "frontend" {
  name         = var.parent_domain
}

resource "aws_route53_record" "frontend_cname" {
  zone_id = aws_route53_zone.frontend.zone_id
  name    = var.acm_ssl_cname_name
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.acm_ssl_cname_value}"]
}

# resource "aws_route53_record" "" {
#   zone_id = aws_route53_zone.frontend.zone_id
#   name    = var.parent_domain
#   type    = "A"
#   alias {
#     name                   = aws_cloudfront_distribution.frontend.domain_name
#     zone_id                = aws_route53_zone.frontend.zone_id
#     evaluate_target_health = true
#   }
# }