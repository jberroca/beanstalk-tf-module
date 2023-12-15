# tf-modules
This is a functional AWS Beanstalk Terraform module. Every time it is used it will create a Beanstalk application and an asociated environment.


## How To Use

### Inputs
This module take the following inputs:
- "bice_vpc_id": "VPC ID where the Elastic Beanstalk application will be deployed."


- "bice_name_application": "Name of the Elastic Beanstalk application."

- "bice_environment": "Name for the Elastic Beanstalk environment."
- "bice_solution_stack_name": "Beanstalk environment stack."

### Output
After instanciate, this module will give as output the arn of the aforementioned beanstalk application and beanstalk environment.

### Mode Of Use
Asuming there is already an existing VPC you can follow the following example
´´´
terraform {
  required_version = ">2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
module "bice_beanstalk_module" {
  source                   = "./beanstalk"
  bice_environment         = "bice-vida-environment"
  bice_name_application    = "bice-vida-beanstalk-application"
  bice_solution_stack_name = "64bit Amazon Linux 2023 v4.0.1 running Go 1"
  bice_vpc_id              = "vpc-01234567890abcdef"
}

´´´