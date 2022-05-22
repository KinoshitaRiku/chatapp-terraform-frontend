#未完成

resource "aws_route53_zone" "frontend" {
  name         = var.parent_domain
}

# resource "aws_route53_record" "parent_to_frontend" {
#   zone_id = aws_route53_zone.frontend.zone_id
#   name    = aws_route53_zone.frontend.name
#   type    = "NS"
#   ttl     = "300"
#   records = aws_route53_zone.frontend.name_servers
# }

resource "aws_route53_record" "frontend_cname" {
  zone_id = aws_route53_zone.frontend.zone_id
  name    = var.acm_ssl_cname_name
  type    = "CNAME"
  ttl     = "300"
  records = var.acm_ssl_cname_value
}

# resource "aws_route53_record" "" {
#   zone_id = aws_route53_zone.frontend.zone_id
#   name    = var.parent_domain
#   type    = "A"
#   alias {
    
#   }
# }