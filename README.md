# Production-Style-Terraform-Project
Production-Style Terraform Project

Architecture Overview


VPC (10.0.0.0/16)
│
├── Public Subnet (Bastion Host + Internet Gateway)
│
└── Private Subnet (EC2 App Server + RDS Database)

Bastion Host → Used for SSH access into private subnet

RDS Database → Accessible only inside VPC

Remote State → Stored in S3 for collaboration

Before running terraform init, you must create the S3 bucket manually in AWS Console (just once).

What You’ve Learned ::---
\
Modules for reusable Terraform code

Remote State in S3 for collaboration

Public/Private networking with Bastion host

RDS Database setup with private access

Security Groups with layered access control
