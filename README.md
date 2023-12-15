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
After declaration, this module will give as output the arn of the aforementioned beanstalk application and beanstalk environment.

### Mode Of Use
Asuming there is already an existing VPC you can follow the following example.
I recommend using terraform.tfvars and variables to initialize the module this way you dont need to repeat yourself and you have better chance on keeping your variable values secret.


## Initialize Provider with a supported version
terraform {
  required_version = "~>2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}
```
# providers.tf
# Configure the AWS Provider with the right region
provider "aws" {
  region = "us-east-1"
}
```

```
# main.tf

# Initialize the module
module "bice_beanstalk_module" {
  source                   = "./beanstalk"
  bice_name_application    = var.bice_name_application
  bice_environment         = var.bice_environment
  bice_solution_stack_name = var.bice_solution_stack_name
  bice_vpc_id              = var.bice_vpc_id
}
## Rest of the code ...

```

```
# variables.tf


variable "bice_vpc_id" {
  type        = string
  description = "VPC ID where the Elastic Beanstalk application will be deployed."
}

variable "bice_name_application" {
  type        = string
  description = "Name of the Elastic Beanstalk application."
}

variable "bice_environment" {
  type        = string
  description = "Name for the Elastic Beanstalk environment."
}

variable "bice_solution_stack_name" {
  type        = string
  description = "Beanstalk environment stack."
}
### more variables ...
```

```
# example_terraform.tfvars

bice_environment         = "bice-vida-environment"
bice_name_application    = "bice-vida-beanstalk-application"
bice_solution_stack_name = "64bit Amazon Linux 2023 v4.0.1 running Go 1"
bice_vpc_id              = "vpc-01234567890abcdef"
### more variables ...
```

