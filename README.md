# 🏗️ Infrastructure as Code Project using Localstack

![Terraform Version](https://img.shields.io/badge/Terraform->=1.2.2-blueviolet?style=flat-square&logo=terraform)
![Python Version](https://img.shields.io/badge/Python->=3.8.10-informational?style=flat-square&logo=python)
![LocalStack Version](https://img.shields.io/badge/LocalStack->=1.0.3-9cf?style=flat-square&logo=portainer)

## Overview

This repository contains instructions for the provision two EC2 instances using Terraform, leveraging **LocalStack** for local AWS environment emulation.

### Key Features
- **Two EC2 instances** are created with different instance types.
- **Custom tags** applied.
- **Optional encrypted EBS volume** attached to one instance.
- **Reusable EC2 module** used to create the instances.
- **Terraform backend** configured to store the state in a local S3 bucket using LocalStack.

## Prerequisites

Before running the solution, ensure you have the following installed:

- **Docker**: To run LocalStack.
- **Terraform**: Version 1.2.2 or higher.
- **Python 3.8.10+** and **pip** (if you're not using Docker for LocalStack).

### Running LocalStack

To run LocalStack using Docker, execute:

```bash
docker run -p 4566:4566 localstack/localstack
```

Alternatively, install and start LocalStack using Python:

```
pip install localstack
localstack start
```

## Solution Details

### Modules

The `aws_instance` module is defined in `modules/aws_instance/` and is responsible for creating the EC2 instances with the required tags, instance types, and other attributes.

#### Inputs

- `ami`: The AMI ID for the EC2 instance.
- `instance_type`: The type of instance (e.g., `t3a.medium`).
- `subnet_id`: The subnet where the instance is created.
- `security_group_ids`: The security groups attached to the instance.
- `key_name`: The key pair for SSH access.
- `team`: The team that owns the instance.
- `environment`: The environment (e.g., `dev`).

#### Outputs

- `instance_id`: The ID of the created EC2 instance.
- `private_ip`: The private IP address of the EC2 instance.

### EBS Volume

An optional encrypted 200G EBS volume is attached to `ec2-service-2` at `/dev/xvdf` using a dynamic block the child module"

### Backend

The state is stored in a local S3-compatible backend using LocalStack, as defined in `backend.tf`:

## Script

A Bash script, `ec2_output.sh`, is included to output EC2 instance details in a table format:

## Project Structure

The project is organized as follows:

## Project Structure

The project is organized as follows:

```bash
.
├── README.md                    # Project instructions 
├── backend.tf                   # Terraform backend configuration
├── main.tf                      # Root Terraform file for instance creation
├── modules/
│   └── aws_instance/            # Child module for creating EC2 instances
│       ├── main.tf              # EC2 instance resource
│       ├── variables.tf         # Module variables
│       └── outputs.tf           # Module outputs
├── outputs.tf                   # Root module outputs (instance IDs and IPs)
├── resources.tf                 # Provided VPC, Subnet, and Security Group resources
├── variables.tf                 # Variable definitions
├── providers.tf                 # Povider configuration
├── versions.tf                  # Terraform and provider versions
└── ec2_output.sh                # Bash script for EC2 instance output in root directory
```

## How to Run

Once LocalStack has been started:

### Create S3 bucket for the .tfstate file

As we are using Amazon S3 to store the state file an S3 bucket should be created before initialising `terraform` 

```bash
aws --endpoint-url=http://localhost:4566 s3 mb s3://terraform-state-bucket
```

### Initialize Terraform

Initialize Terraform to prepare the environment:

```bash
terraform init
```
### Plan and Apply the Terraform Configuration

Run a plan first to ensure everything is configured as expected:

```bash
terraform plan
```

### Apply the Terraform Configuration

Apply the Terraform configuration to create the resources:

```bash
terraform apply
```

When prompted, enter yes to confirm the infrastructure creation.

### View Outputs

The instance IDs and private IPs will be displayed after the Terraform apply process finishes.