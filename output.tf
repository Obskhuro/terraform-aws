output "vpc_id" {
  value = aws_vpc.main.id
}

output "base_instance_public_ip" {
  description = "IP publique de l'instance de base (pour SSH)"
  value       = aws_instance.base_instance.public_ip
}

output "scaling_ami_id" {
  description = "ID de l'AMI capturée"
  value       = aws_ami_from_instance.scaling_ami.id
}

output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

output "load_balancer_dns" {
  description = "URL du Load Balancer"
  value       = aws_lb.app_lb.dns_name
}
