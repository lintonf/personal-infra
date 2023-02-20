data "aws_route53_zone" "fisher_sh" {
  name = "fisher.sh"
}

resource "aws_route53_record" "fisher_sh" {
  zone_id = data.aws_route53_zone.fisher_sh.zone_id
  name    = "fisher.sh"
  type    = "A"

  alias {
    name                   = aws_s3_bucket_website_configuration.fisher_sh.website_domain
    zone_id                = aws_s3_bucket.fisher_sh.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_fisher_sh" {
  zone_id = data.aws_route53_zone.fisher_sh.zone_id
  name    = "www.fisher.sh"
  type    = "A"

  alias {
    name                   = aws_s3_bucket_website_configuration.www_fisher_sh.website_domain
    zone_id                = aws_s3_bucket.www_fisher_sh.hosted_zone_id
    evaluate_target_health = false
  }
}
