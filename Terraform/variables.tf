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



variable "http_port" {
  description = "HTTP port for the load balancer listener"
  type        = number
  default     = 80
}

variable "ssl_policy" {
  description = "SSL policy for the HTTPS listener"
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}

variable "redirect_status_code" {
  description = "HTTP status code for redirect from HTTP to HTTPS"
  type        = string
  default     = "HTTP_301"

  validation {
    condition     = contains(["HTTP_301", "HTTP_302"], var.redirect_status_code)
    error_message = "Status code must be HTTP_301 (permanent) or HTTP_302 (temporary)."
  }
}

variable "assign_public_ip" {
  type = bool
}