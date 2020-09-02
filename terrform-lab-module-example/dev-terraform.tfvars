instance_type = "t2.micro"
key_name      = "new_account_key_pair"
env_type      = "dev"
ec2_tags = {
  Name        = "terraform-example"
  Environment = "dev"
}