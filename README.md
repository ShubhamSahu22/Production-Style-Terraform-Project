# Production-Style-Terraform-Project
Production-Style Terraform Project
Architecture Overview
scss
Copy
Edit
VPC (10.0.0.0/16)
│
├── Public Subnet (Bastion Host + Internet Gateway)
│
└── Private Subnet (EC2 App Server + RDS Database)
Bastion Host → Used for SSH access into private subnet

RDS Database → Accessible only inside VPC

Remote State → Stored in S3 for collaboration

