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
variable "environment" {
  type = string
}
variable "target_group_port" {
  type = number
}

variable "health_check_path" {
  type = string
}


variable "https_port" {
  description = "HTTPS port for the load balancer listener"
  type        = number
  default     = 443
}

variable "http_port" {
  description = "HTTP port for the load balancer listener"
  type        = number
  default     = 80
}

variable "certificate_arn" {
  type = string

}