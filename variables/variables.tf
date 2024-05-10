# variables for instance
variable "image_id"{
    type = string
    default = "ami-090252cbe067a9e58"
    description = "RHEL-9 AMI ID"

}
variable "sg_name"{
    
}
variable "instance_type"{
    type=string
    default = "t3.micro"
    
}
variable "tags"{
    default = {
        name="DB"
        project="Expense"
        module="DB"
        environment="Dev"
    }
    
}
# variables for security group(sg)

variable "sg_name" {
    default = "allow_ssh"
  
}
variable "description" {
    default = "allowing ssh prot 22"
  
}
variable "port" {
    default = "22"
  
}
variable "protocol" {
    default = "tcp"
  
}
variable "cidr_blocks" {
    type=list(string)
    default = ["0.0.0.0/0"]
  
}