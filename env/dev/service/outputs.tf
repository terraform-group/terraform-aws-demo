output "ecs_ids" {
  value = [for k, v in aws_instance.web : v.id]

}