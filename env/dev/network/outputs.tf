output "vpc_id" {
  value = aws_vpc.main.id

}

output "subnet_id" {
  value = aws_subnet.subnet.*.id
}

output "security_group_id" {
  value = aws_security_group.allow.id

}

output "route_table_id" {
  value = data.aws_route_table.table.id
}