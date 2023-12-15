output "Beanstalk_application_arn" {
  value = aws_elastic_beanstalk_application.bice_beanstalk_application.arn
  description = "Created Elastic Beanstalk application arn"

}

output "beanstalk_environment_arn" {
  value = aws_elastic_beanstalk_environment.bice_beanstalk_environment.arn
  description = "created Elastic Beanstalk environment arn"
}