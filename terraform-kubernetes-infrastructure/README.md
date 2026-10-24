# Terraform Kubernetes Infrastructure on AWS

## Project Overview
This project provisions AWS infrastructure for a Kubernetes environment using Terraform. It includes a VPC, public and private subnets, routing, a NAT Gateway, IAM roles, and an Amazon EKS cluster with a managed node group.

## Technologies Used
- AWS
- Terraform
- Amazon EKS
- Amazon VPC
- IAM
- EC2

## Infrastructure Components
- Custom VPC with public and private subnets
- Internet Gateway and route tables
- NAT Gateway for private subnet outbound access
- IAM roles and policies for EKS and worker nodes
- Amazon EKS cluster
- Managed node group using `t3.micro` instances

## Project Structure
```text
terraform-kubernetes-infrastructure/
├── eks.tf
├── iam.tf
├── output.tf
├── provider.tf
├── secruity.tf
├── variable.tf
├── vpc.tf
├── terraform.tfvars.example
├── .terraform.lock.hcl
└── README.md
```

## Prerequisites
- An AWS account
- Terraform installed
- AWS CLI configured with appropriate permissions

## Usage
1. Clone this repository.
2. Navigate to the project directory.
3. Create `terraform.tfvars` using the example file and configure your own values.
4. Initialize Terraform:
   ```bash
   terraform init
   ```
5. Review the planned changes:
   ```bash
   terraform plan
   ```
6. Create infrastructure only when needed:
   ```bash
   terraform apply
   ```
7. Remove resources when finished:
   ```bash
   terraform destroy
   ```

## Important Notes
- AWS resources may incur charges, including EKS and NAT Gateway.
- Review the Terraform plan before applying changes.
- Do not commit AWS credentials, `terraform.tfvars`, or Terraform state files.
- The infrastructure is currently destroyed; running `terraform apply` can create resources again.

## Learning Purpose
This project was created for hands-on practice with Terraform and AWS infrastructure provisioning.
