# Lab 16.1: Terraform Basics

Difficulty: Advanced. Time: 60 minutes. XP: +100.

## Objective

Deploy a cloud VM using Terraform. Learn Infrastructure as Code by creating, planning, and applying a Terraform configuration.

## Starting State

Terraform installed (`terraform --version`). Cloud provider credentials configured.

## Instructions

1. Create project structure:
   ```bash
   mkdir -p ~/terraform-labs/lesson1
   cd ~/terraform-labs/lesson1
   ```

2. Create `main.tf`:
   ```hcl
   terraform {
     required_providers {
       aws = {
         source  = "hashicorp/aws"
         version = "~> 5.0"
       }
     }
     required_version = ">= 1.5.0"
   }

   provider "aws" {
     region = var.aws_region
   }

   resource "aws_instance" "web_server" {
     ami           = var.ami_id
     instance_type = var.instance_type

     tags = {
       Name        = "LinuxBootcamp-WebServer"
       Environment = var.environment
       Project     = "LinuxMastery2026"
     }

     root_block_device {
       volume_size = 20
       volume_type = "gp3"
     }

     user_data = <<-EOF
                 #!/bin/bash
                 apt-get update
                 apt-get install -y nginx
                 systemctl enable nginx
                 systemctl start nginx
                 echo "<h1>Hello from Linux Mastery Bootcamp 2026!</h1>" > /var/www/html/index.html
                 EOF
   }

   resource "aws_security_group" "web_sg" {
     name_prefix = "web-sg-"

     ingress {
       from_port   = 22
       to_port     = 22
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
     }

     ingress {
       from_port   = 80
       to_port     = 80
       protocol    = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
     }

     egress {
       from_port   = 0
       to_port     = 0
       protocol    = "-1"
       cidr_blocks = ["0.0.0.0/0"]
     }

     tags = {
       Name = "web-security-group"
     }
   }
   ```

3. Create `variables.tf`:
   ```hcl
   variable "aws_region" {
     description = "AWS region"
     type        = string
     default     = "us-east-1"
   }

   variable "ami_id" {
     description = "Ubuntu 24.04 AMI ID"
     type        = string
     default     = "ami-0c7217cdde317cfec"
   }

   variable "instance_type" {
     description = "EC2 instance type"
     type        = string
     default     = "t2.micro"
   }

   variable "environment" {
     description = "Environment name"
     type        = string
     default     = "development"
   }
   ```

4. Initialize and plan:
   ```bash
   terraform init
   terraform plan
   ```

5. Apply:
   ```bash
   terraform apply
   ```

6. Verify:
   ```bash
   terraform show
   terraform output public_ip
   curl http://$(terraform output -raw public_ip)
   ```

## Verification

The web server responds with: `<h1>Hello from Linux Mastery Bootcamp 2026!</h1>`

## Failure Cases

| Problem | Cause | Solution |
|---------|-------|----------|
| No valid credentials | AWS not configured | Run `aws configure` |
| AMI not found | Wrong AMI for region | Find correct AMI |
| Instance type not supported | Free tier limitation | Use t2.micro |

## What You Learned

- Terraform workflow: init, plan, apply, destroy
- Resources: declarative infrastructure definition
- Variables: parameterization
- State: tracking of created resources
- User data: bootstrap scripts for new instances

## Challenge

1. Add output for instance public IP
2. Restrict SSH to your IP only
3. Use data source to find latest Ubuntu AMI automatically
4. Create second instance behind load balancer
5. Use remote state (S3 bucket) for team collaboration
