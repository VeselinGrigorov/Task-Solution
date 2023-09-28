module "ecs_load_balancer" {
  source = "infrablocks/ecs-load-balancer/aws"
  version = "0.1.10"

  region = "eu-east-1"
  vpc_id = "aws_vpc.main.id"
  subnet_ids = "10.0.0.0/16"
  
  component = "important-component"
  deployment_identifier = "production"
  
  service_name = "memcache"
  service_port = "11211"
  service_certificate_arn = "arn:aws:acm:eu-west-2:121408295202:certificate/4e0452c7-d32d-4abd-b5f2-69490e83c936"
  
  domain_name = "example.com"
  public_zone_id = "Z1WA3EVJBXSQ2V"
  private_zone_id = "Z3CVA9QD5NHSW3"
  
  health_check_target = "TCP:11211"
  
  allow_cidrs = [
    "10.0.0.0/16",
    "10.0.0.0/24"
  ]
  
  include_public_dns_record = "yes"
  include_private_dns_record = "yes"
  
  expose_to_public_internet = "yes"
}