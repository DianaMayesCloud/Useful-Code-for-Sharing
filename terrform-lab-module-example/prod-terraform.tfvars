instance_type = "t3.micro"
key_name      = "new_account_key_pair"
env_type      = "prod"
ec2_tags = {
  Name        = "terraform-example"
  Environment = "prod"
}
