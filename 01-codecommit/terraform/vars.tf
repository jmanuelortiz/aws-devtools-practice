variable "prefix_resource" {
  description = "description"
  default     = "jmo"
}




locals {
  common_tags  = {
      environment = "poc",
      proyect = "aws-devtools"
  }
}
