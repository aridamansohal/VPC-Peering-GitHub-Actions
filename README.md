# AWS Inter-Region VPC Peering (Terraform)

This project provisions:

- Two VPCs in different AWS regions
- Private subnets
- Inter-region VPC peering
- Cross-region private DNS resolution
- Route tables
- Security groups (production-style)

## Architecture

Primary Region: us-east-1  
Secondary Region: us-west-2  

CIDRs:
- 10.0.0.0/16
- 10.1.0.0/16

## Prerequisites

- Terraform >= 1.5
- AWS credentials configured
- Graphviz (optional for terraform graph)

## Usage

```bash
terraform init
terraform plan
terraform apply
