variable ami {
  type        = string
  default     = "ami-053b0d53c279acc90"
  description = "ubuntu ami for aws instance"
}

variable type {
  type        = string
  default     = "t2.medium"
  description = "instance type"
}

# variable privatekeypath {
#   type        = string
#   default     = "/home/sageiyke/sage-key.pem"
# }

variable region {
  type        = string
  default     = "us-east-1"
}