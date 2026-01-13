variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "container_port" {
  description = "Container port exposed by the app"
  type        = number
}

variable "desired_count" {
  description = "Number of ECS tasks"
  type        = number
}

variable "domain_name" {
  description = "Root domain name"
  type        = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_az1_cidr" {
  type = string
}

variable "public_subnet_az2_cidr" {
  type = string
}

variable "image_url" {
  description = "Docker image URI in ECR"
  type        = string
}

variable "task_cpu" { type = number }

variable "task_memory" { type = number }

variable "assign_public_ip" { type = bool }


variable "task_family" {
  description = "Family name for ECS task definition"
  type        = string
}

variable "health_check_path" {
  type        = string
  description = "Health check path for your app"
  default     = "/"
}
