variable "gcp_region" {
  type = string
  default = "uscentral1"
}
variable "gcp_zone" {
  type = string
  default = "uscentral1-a"
}
variable "project_id" {
  type = string
  description = "Provider project"
  default = "xterraform-gcp"
}