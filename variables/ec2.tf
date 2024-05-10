# create ec2 instance-----AMI ID,instance_type,security group and tags.check "name" 
  
resource "aws_instance" "db" {
    ami=var.image_id
    instance_type =var.instance_type    
    tags=var.tags

    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  
}
# create security group----securitygroupname,description,inbound,outbound and tags.
resource "aws_security_group" "allow_ssh" {

    name= var.sg_name
    description = var.description
    # igress--inbound egress--outbound are blocks not a map ot list
    ingress {
         from_port        = var.port
         to_port          = var.port
         protocol         = var.protocol
         cidr_blocks      = var.cidr_blocks


    }
    egress {
         from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        #cidr_blocks      = ["0.0.0.0/0"]
        cidr_blocks      = var.cidr_blocks

    }
# tags---map
     tags = {
        Name = "allow_ssh"
        CreatedBy = "nirmala"
    }


  
}