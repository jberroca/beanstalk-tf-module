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