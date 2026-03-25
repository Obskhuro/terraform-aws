resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Sauvegarde la clé privée en local
resource "local_sensitive_file" "private_key" {
  content         = tls_private_key.ssh_key.private_key_pem
  filename        = "${path.module}/keypair-yanis.pem"
  file_permission = "0400"
}

# Enregistre la clé publique dans AWS
resource "aws_key_pair" "keypair" {
  key_name   = "keypair-yanis"
  public_key = tls_private_key.ssh_key.public_key_openssh
}