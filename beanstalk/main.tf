resource "aws_elastic_beanstalk_application" "bice_beanstalk_application" {
  name = var.bice_name_application

}

resource "aws_elastic_beanstalk_environment" "bice_beanstalk_environment" {
  name                = var.bice_environment
  application         = aws_elastic_beanstalk_application.bice_beanstalk_application.name
  solution_stack_name = var.bice_solution_stack_name
  # Settings for the environment
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.bice_vpc_id 
  }
}