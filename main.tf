##To fully deploy an app with EBS you need to host the code somewhere, in this example S3 is used to do this.

resource "aws_s3_bucket" "bice_app_s3" {
  bucket = "${var.bice_name_application}-s3-bucket"

  tags = {
    Name = "Bice Vida app EBS"
  }
}

resource "aws_s3_object" "bice_app_deployment" {
  bucket = aws_s3_bucket.bice_app_s3.id
  key    = "application.zip"
  source = "application.zip" ## Change for the real local path to your application code.
}
module "bice_beanstalk_module" {
  source                   = "./beanstalk"
  bice_name_application    = var.bice_name_application
  bice_environment         = var.bice_environment
  bice_solution_stack_name = var.bice_solution_stack_name
  bice_vpc_id              = var.bice_vpc_id
}

##The elastic beanstalk module could be modified to take the s3 as an input and then this resource could also be created inside the module.
resource "aws_elastic_beanstalk_application_version" "bice_ebs_version" {
  name        = "${var.bice_name_application}-version"
  application = var.bice_name_application
  description = "Bice vida EBS application version created by terraform"
  bucket      = aws_s3_bucket.bice_app_s3.id
  key         = aws_s3_object.bice_app_deployment.id
}