data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "public_server1" {

  for_each                    = aws_subnet.public_subnet
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = each.value.id
  associate_public_ip_address = var.associate_public_ip_address
  instance_type               = "t3.micro"
  key_name                    = "my-production-key"
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  tags                        = local.common_tags
  #   tags = {
  #     Name        = lower("${local.environment}-publicserver-${each.key}")
  #     Environment = local.environment
  #     owner       = local.owner
  #     reference   = local.reference
  #   }

  connection {
    type = "ssh"
    user = "ubuntu"
    # private_key = file(pathexpand("~/terraform_ec2_key"))
    #below for hcp 
    private_key = var.ssh_private_key
    host        = self.public_ip
  }
  #    1. FILE PROVISIONER
  # Copies a local script file to the remote EC2 instan
  provisioner "file" {
    # source      = "/Users/MarellaSiva.Kumar/scripts/install.sh"
    source      = "install.sh"
    destination = "/tmp/install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install.sh",
      "sudo /tmp/install.sh"
    ]
  }
  provisioner "local-exec" {
    command = "echo 'Instance ${self.id} created with IP ${self.public_ip}' >> creation_log.txt"
  }

}



# resource "aws_key_pair" "deployer" {
#   key_name = "my-production-key"
#   # Point to the new PUBLIC key
#   public_key = file(pathexpand("~/terraform_ec2_key.pub"))
# }

# resource "aws_key_pair" "my_new_ec2_key" {
#   key_name = "my-awesome-key"

#   # Upload the PUBLIC key (.pub)
#   public_key = file(pathexpand("~/.ssh/my_siva_key.pub"))

# }

##below for HCP

resource "aws_key_pair" "deployer" {
  key_name = "my-production-key"
  # Use the variable instead of reading a file
  public_key = var.ssh_public_key
}

