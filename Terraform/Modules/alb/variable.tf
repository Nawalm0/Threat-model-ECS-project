variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_security_group_id" {
  type = string
}

variable "target_group_port" {
  type        = number
  description = "Port your container listens on"
}

variable "health_check_path" {
  type        = string
  description = "Health check path for your app"
  default     = "/"
}
