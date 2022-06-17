resource "alicloud_alidns_record" "record" {
  domain_name = local.dns_zone_name
  rr          = "aws"
  type        = "CNAME"
  value       = aws_lb.test_lb.dns_name
  remark      = "Test new alidns record."
  status      = "ENABLE"
}