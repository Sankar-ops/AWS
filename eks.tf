module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "20.36.0"

    cluster_name = local.cluster_name
    cluster_version = local.cluster_version

    cluster_endpoint_public_access = true
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets
      
    cluster_addons = {
        coredns = {
          most_recent = true
        }

        kube-proxy = {
          most_recent = true  
        }

        vpc_cni = {
           most_recent = true
        }
    }
    eks_managed_node_groups = {
        tfmethod = {
            desired_size = 2
            max_size = 3
            min_size = 1

            instance_type = local.instance_type
            key_name = local.key_name
            iam_role_arn = "arn:aws:iam::925933724476:instance-profile/eksmanual2"
            iam_role_additional_policies = {
              ecr_access = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
            }
        
        }

    }
    
    tags = local.tags
}