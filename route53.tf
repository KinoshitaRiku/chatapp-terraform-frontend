#未完成

# data "aws_route53_zone" "parent" {
#   name         = var.parent_domain
#   private_zone = false
# }

# resource "aws_route53_zone" "frontend" {
#   name = "self-introduction.${data.aws_route53_zone.parent.name}"
# }

# resource "aws_route53_record" "parent_to_frontend" {
#   zone_id = data.aws_route53_zone.parent.zone_id
#   name    = aws_route53_zone.frontend.name
#   type    = "NS"
#   ttl     = "300"
#   records = aws_route53_zone.frontend.name_servers
# }