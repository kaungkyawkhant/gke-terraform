variable "project_id" {
    type = string
    default = "third-runway-371803"
}

variable "region" {
  type = string
  default = "australia-southeast1"
}

variable "cluster_name" {
  type = string
  default = "gke-cluster"
}

variable "vpc_name" {
  type = string
  default = "default"
}

variable "subnet_name" {
  type = string
  default = "default"
}

variable "node_count" {
  type = string
  default = 2
}
