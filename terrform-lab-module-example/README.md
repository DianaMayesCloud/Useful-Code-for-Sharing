# This terrform-lab-module-example Directory creates:

1. **EC2 instance** that has:
   1) Data Source to get the Account ID, which is used in the S3 bucket name (in the same file)
   2) 3 calls to the S3 bucket Module to create 3 buckets
   3) EC2 Instance where:
        - ImageId, which gets called in variables.tf file
        - Instance type, which gets called in variables.tf file 
        - SecurityGroupIds, which has a list of 2 variables that are the Ids of the 2 Security Groups
        - KeyName, which gets called in variables.tf file
        - Tags, which gets called in variables.tf file
        - IamInstanceProfile, which calls for the IamInstanceProfile Resource also created in this file 
        - UserData, coded here
   4) Instance Profile, which lists the Role that's in variables.tf by its name
   5) Security Group: Hard coded 
2. **S3 bucket** created in a module. The module contains 3 things:
   1) main.tf file where the S3 bucket variable is created (which is where the S3 bucket variables will be called from) 
   2) variables.tf file where the S3 bucket is declared. The file contains:
      - S3 bucket Description and Type
      - S3 bucket Tags Type
   3) Output file which will output:
      - S3 bucket arn
3. **IAM policy** whose purpose is to create an IAM Role to be attached to the EC2 instance giving it permission to 
    access the S3 Bucket. It has the following *Resources*:
   1) IAM Policy with Resource S3 bucket 
   2) IAM Role where the service is ec2.amazonaws.com
   3) IAM role policy Attachment whose purpose is to attach the Role to the Policy
   4) variables.tf file where it calls for:
        - the following *Properties*:
           - ImageId (ami)
           - Instance Type 
           - KeyName
           - EC2 Tags
           - Environment Type 
        - the following *Parameter*:
           - Environment (dev, prod)
4. **Dev Environment** where:
      - the following *Properties* are assigned a Value:
        - InstanceType
        - KeyName
      - the following *Parameter* is assigned a Value:
        - Environment = Dev
5. **Prod Environment**
      - the following *Properties* are assigned a Value:
         - InstanceType
         - KeyName
      - the following *Parameter* is assigned a Value:
       - Environment = Dev
6. **Output** file which will output 2 things:
      - Private IP address of the EC2 instance
      - Public IP address of the EC2 instance 


-------------------------------------------------------------

Creator's README.md

Environment variable

```
export TF_VAR_key_name=my-key
```


Dev env
```
terraform plan -var-file=dev-terraform.tfvars
```
Prod env
```
terraform plan -var-file=dev-terraform.tfvars
```