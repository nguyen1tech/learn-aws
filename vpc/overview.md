# VPC - Virtual Private Network
<img width="993" alt="image" src="https://github.com/nguyen1tech/learn-aws/assets/123853507/00b24021-721b-439f-88f7-6f9c42622db3">
Provision a **logically isolated section** of the AWS cloud where you can launch AWS resources in **a virtual network** that you define. Gives you complete control over your networking environment

## Core components
- Internet Gateway (IGW)
- Virtual Private Gateway (VPN Gateway)
- Routing Tables
- Network Access Control List - NACLs - Stateless
- Security Groups - SG - Stateful
- Public subnets
- Private subnets
- NAT Gateway
- Customer Gateway
- VPC Endpoints
- VPC Peering

## Key Features
- VPC are Region specific - they do not span Regions
- You can create up to 5 VPC per Region
- Every Region come with a default VPC
- You have **200 subnets** per VPC
- You can use **IPV4 Cidr Block** and in addition to **IPV6 Cidr Block**
- Cost nothing: VPC, Route Tables, Nacls, Internet Gateway, Security Group and subnet, VPC Peering
- Something cost money: NAT Gateway, VPC Endpoint, VPN Gateway, Customer Gateway
- DNS hostnames

## Default everywhere IP address
- 0.0.0.0/0 is also known as default. It represents **all possible IP addresses**
- When we specify 0.0.0.0/0 in our route table for IGW we allow internet access
- When we specify 0.0.0.0/0 in our security group inbound rules we are allowing all traffic from the internet access our public resources

## VPC Peering
Allows you to connect one VPC to another over a **direct network route** using **private IP addresses**

## Route Tables
Route Tables are used to determine where network traffic is **directed**. Each subnet in your VPC must be associated with a route table

## Internet Gateway
Allows your VPC access to the internet
- IGW does 2 things:
  - Provide a target in your VPC route tables for internet-routable traffic
  - Perform network address translation for instances that have been **assigned public IP addresses**
- To route out to the internet you need to add a route to the internet gateway and set the destination to 0.0.0.0/0
 <img width="962" alt="image" src="https://github.com/nguyen1tech/learn-aws/assets/123853507/5925f11b-9ac3-4714-8352-f2291ba52bfd">

## Bastion/Jumbox
<img width="542" alt="image" src="https://github.com/nguyen1tech/learn-aws/assets/123853507/f54718fa-8186-4425-8790-6b94d06d0e02">

- Bastions are EC2 instances which are security harden. They are designed to help you gain access to your EC2 instances via SSH or RCP that are in a **private subnet**

