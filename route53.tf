#未完成

resource "aws_route53_zone" "frontend" {
  name         = var.parent_domain
  private_zone = false
}

# resource "aws_route53_record" "parent_to_frontend" {
#   zone_id = aws_route53_zone.frontend.zone_id
#   name    = aws_route53_zone.frontend.name
#   type    = "NS"
#   ttl     = "300"
#   records = aws_route53_zone.frontend.name_servers
# }