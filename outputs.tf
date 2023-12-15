output "beanstalk_application_arn" {
  value       = module.bice_beanstalk_module.Beanstalk_application_arn
  description = "Created Elastic Beanstalk application arn"

}

output "beanstalk_environment_arn" {
  value       = module.bice_beanstalk_module.beanstalk_environment_arn
  description = "created Elastic Beanstalk environment arn"
}
