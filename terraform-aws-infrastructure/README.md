# AWS Infrastructure Automation Using Terraform

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to deploy and manage AWS infrastructure. It includes a custom VPC, two public subnets, two EC2 web servers, an Application Load Balancer, security groups, and an S3 bucket.

The EC2 instances run Apache web servers and display a custom HTML welcome page. The Application Load Balancer distributes incoming HTTP traffic between the two instances.

## Technologies Used

- AWS
- Terraform
- Amazon EC2
- Amazon VPC
- Public Subnets
- Internet Gateway
- Route Tables
- Security Groups
- Application Load Balancer (ALB)
- Target Groups and Health Checks
- Amazon S3
- Apache Web Server
- Bash Scripting
- Git and GitHub

## Project Architecture

The infrastructure includes:

- One custom VPC
- Two public subnets in separate Availability Zones
- One Internet Gateway
- One public route table with subnet associations
- One security group
- Two EC2 instances running Apache
- One Application Load Balancer
- One target group with HTTP health checks
- One HTTP listener on port 80
- One S3 bucket

## Project Directory Structure

```text
aws-proj/
├── .gitignore
├── .terraform.lock.hcl
├── README.md
├── alb.tf
├── ec2.tf
├── output.tf
├── provider.tf
├── s3.tf
├── security.tf
├── userdata.sh
├── variable.tf
└── vpc.tf
```

**Note:** The `.terraform/` directory and Terraform state files are local working files and should not be committed to GitHub.

## File Descriptions

| File | Purpose |
|---|---|
| `provider.tf` | Configures the AWS provider and region. |
| `variable.tf` | Defines input variables for the infrastructure. |
| `vpc.tf` | Creates the VPC, subnets, Internet Gateway, and routing resources. |
| `security.tf` | Defines security group rules for network access. |
| `ec2.tf` | Creates two EC2 web server instances. |
| `alb.tf` | Configures the Application Load Balancer, target group, listener, and attachments. |
| `s3.tf` | Creates an Amazon S3 bucket. |
| `output.tf` | Displays the ALB DNS name after deployment. |
| `userdata.sh` | Installs and starts Apache and creates the web page. |
| `.gitignore` | Prevents selected local and sensitive files from being committed. |
| `.terraform.lock.hcl` | Records the selected Terraform provider versions and checksums. |

## Infrastructure Configuration

### VPC and Networking

- VPC CIDR: `10.0.0.0/16`
- Public Subnet 1: `10.0.0.0/24`
- Public Subnet 2: `10.0.1.0/24`
- Availability Zones: `us-east-1a` and `us-east-1b`
- AWS Region: `us-east-1`
- Internet Gateway for internet connectivity
- Public route table associated with both subnets

### EC2 Web Servers

Two EC2 instances are deployed in separate public subnets. Both use the configured AMI, instance type, and EC2 key pair.

The `userdata.sh` script automatically installs Apache and configures the default web page during instance initialization.

Expected website content:

`welcome to mudassar website`

### Application Load Balancer

The internet-facing Application Load Balancer accepts HTTP requests on port 80 and forwards them to the target group.

The target group contains both EC2 instances and uses an HTTP health check on `/`.

### Amazon S3

The project provisions an S3 bucket as part of the infrastructure demonstration.

## Prerequisites

Before deploying this project, make sure you have:

- An AWS account
- Terraform installed
- AWS credentials configured securely
- Git installed
- An existing EC2 key pair if required by your Terraform configuration
- Appropriate AWS permissions to create the required resources

## Deployment Instructions

Open PowerShell in the project directory:

```powershell
cd C:\Users\chand\aws-proj
```

Initialize Terraform:

```powershell
terraform init
```

Format the configuration files:

```powershell
terraform fmt
```

Validate the configuration:

```powershell
terraform validate
```

Preview the proposed infrastructure changes:

```powershell
terraform plan
```

Create the infrastructure:

```powershell
terraform apply
```

Review the plan and enter `yes` when prompted if you want to proceed.

## Verify the Website

After successful deployment, display the Application Load Balancer DNS name:

```powershell
terraform output alb_dns_name
```

Open the returned DNS name in a browser using HTTP:

```text
http://<ALB-DNS-NAME>
```

The expected response is:

`welcome to mudassar website`

## Destroy the Infrastructure

When the infrastructure is no longer required, preview the resources that will be removed:

```powershell
terraform plan -destroy
```

Destroy the resources managed by Terraform:

```powershell
terraform destroy
```

Review the destruction plan before confirming with `yes`.

## Security Considerations

- Do not upload AWS access keys, passwords, private keys, or sensitive Terraform variable files to GitHub.
- Restrict SSH access on port 22 to your own public IP address rather than allowing access from `0.0.0.0/0`.
- HTTP traffic on port 80 is not encrypted. Use HTTPS for production applications.
- Check the S3 bucket for important data before destroying it.
- Review your AWS resources and billing after completing the project.
- Keep Terraform state files out of public repositories because they may contain sensitive infrastructure details.

## Project Testing and Cleanup

The configuration was initialized, validated, and planned successfully. The infrastructure was deployed, and the website was tested through the EC2 public IP addresses and the Application Load Balancer DNS name.

The infrastructure was subsequently destroyed using Terraform.

Reported cleanup result:

`Destroy complete! Resources: 16 destroyed.`

The subsequent `terraform state list` command returned no resources.

## Learning Outcomes

This project provides practical experience with:

- Infrastructure as Code using Terraform
- AWS networking and VPC configuration
- EC2 provisioning and automated web server installation
- Load balancing across multiple instances
- Security groups and network access
- S3 bucket provisioning
- Terraform validation, planning, deployment, and destruction
- Project documentation and GitHub repository preparation

## Disclaimer

This project is intended for learning and portfolio demonstration. Review security, availability, and cost requirements before using a similar architecture in production.
