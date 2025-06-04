locals {
    region = "us-east-1"
    cluster_name = "tfcluster"
    cluster_version = "1.32"
    vpc_cidr = "10.0.0.0/16"
    azs = ["us-east-1a","us-east-1b"] 
    private_subnets = ["10.0.1.0/24","10.0.2.0/24"]
    instance_type = "t3.micro"
    key_name = "tf automatic"
     tags = {
       name = "demotf"
    }

}

provider "aws"{
    region = local.region
}