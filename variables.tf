variable "vm_count" {
  description = "Number of virtual machines to create"
  type        = number
   
}

variable "vm_size" {
  description = "Size of the virtual machines"
  type        = string
  
}

variable "vm_image" {
  description = "Image SKU for the virtual machines"
  type        = string
   
}
