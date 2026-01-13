module "vpc" {
  source                 = "./modules/vpc"
  vpc_cidr               = var.vpc_cidr
  project_name           = var.project_name
  public_subnet_az1_cidr = var.public_subnet_az1_cidr
  public_subnet_az2_cidr = var.public_subnet_az2_cidr

}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id             = module.vpc.vpc_id
  app_port           = var.container_port
  alb_sg             = "${var.project_name}-alb-sg"
  alb_sg_description = "ALB security group"
}

module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}

module "alb" {
  source = "./modules/alb"

  project_name          = var.project_name
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.alb_sg_id

  target_group_port = var.container_port
  health_check_path = "/"
}


module "ecs_service" {
  source = "./modules/ecs_fargate"

  project_name  = var.project_name
  service_name  = "${var.project_name}-service"
  desired_count = var.desired_count

  task_family = var.task_family
  task_cpu    = var.task_cpu
  task_memory = var.task_memory

  container_name = var.project_name
  container_port = var.container_port
  image_url      = var.image_url

  subnet_ids            = module.vpc.public_subnet_ids
  ecs_security_group_id = module.security_groups.ecs_sg_id

  assign_public_ip = true
  target_group_arn = module.alb.target_group_arn

  execution_role_arn = module.iam.ecs_task_execution_role_arn
}

module "acm" {
  source      = "./modules/acm"
  domain_name = var.domain_name
}
