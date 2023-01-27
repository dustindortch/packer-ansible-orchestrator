variable "az_source_image" {
  type = object({
    os_type         = string
    image_publisher = string
    image_offer     = string
    image_sku       = string
    vm_size         = string
  })
  default = {
    os_type         = "Linux"
    image_publisher = "RedHat"
    image_offer     = "RHEL"
    image_sku       = "91-gen2"
    vm_size         = "Standard_DS2_v2"
  }
  # az vm image list  --offer RHEL --publisher RedHat --all --output table
}

variable "az_build" {
  type = object({
    build_resource_group_name              = string
    virtual_network_resource_group_name    = string
    virtual_network_name                   = string
    virtual_network_subnet_name            = string
    private_virtual_network_with_public_ip = bool
    temp_computer_name                     = string
    temp_nic_name                          = string
  })
  default = {
    build_resource_group_name              = "rg-packer-ansible-orchestrator"
    virtual_network_resource_group_name    = "rg-packer-ansible-orchestrator-network"
    virtual_network_name                   = "vnet-packer-ansible-orchestrator-network"
    virtual_network_subnet_name            = "orchestrators"
    private_virtual_network_with_public_ip = true
    temp_computer_name                     = "vm-packer-ansible-orchestrator"
    temp_nic_name                          = "vm-packer-ansible-orchestrator_nic0"
  }
}

variable "az_target_image" {
  type = object({
    managed_image_resource_group_name = string
    managed_image_name_prefix         = string
  })
  default = {
    managed_image_resource_group_name = "rg-packer-ansible-orchestrator"
    managed_image_name_prefix         = "img-no-image-created"
  }
}