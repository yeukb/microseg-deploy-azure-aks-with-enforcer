variable "resource_group_name" {}

variable "location" {}

variable "cluster_name" {}

variable "adminUsername" {}

variable "ssh_public_key" {}

variable "agent_count" {}

variable "vmSize" {}

variable "service_cidr" {}

variable "dns_service_ip" {}

variable "k8s_version" {}

variable "cns_api" {}

variable "cns_namespace" {}

variable "cns_enforcerd_clustertype" {
    default = "aks"
}

variable "cns_enforcerd_image" {}

variable "cns_enforcerd_cni_bin_dir" {}

variable "cns_enforcerd_cni_conf_dir" {}

variable "cns_enforcerd_install_cni_plugin" {
    default = ""
}

variable "cns_enforcerd_install_runc_proxy" {
    default = ""
}

variable "cns_enforcerd_cni_conf_filename" {
    default = ""
}

variable "cns_enforcerd_cni_primary_conf_file" {
    default = ""
}
