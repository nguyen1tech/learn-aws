# EC2 - Amazon Elastic Compute Cloud
Secure and resizable compute capacity for virtually any workload

## Instance Types:
- General purpose: A1, T3, T3a, T2, M5, M5a, M4 -> Balance of compute, memory, networking resources - web servers, code respositories
- Compute Optimized: C5, C5n, C4 -> Ideal for compute bound applications and benefit from high performance processor - scientific modelling, dedicated gaming servers and ads server engines
- Memory Optimized: R5, R5a, X1e, X1, High Memory, z1d -> Fast performance for workloads that process large datasets in memory -> In-memory caches, in-memory databases, real time big dat analytics
- Accelerated Optimized: P3, P2, G3, F1 -> hardware accelerator or co-processor - Machine learning, computational finance, speech recognition
- Storage Optimized: I3, I3ne, D2, H1 -> High sequential read and write access to very large datasets on local storage - NoSQL, in-memory or transactional databases, data warehousing

## Instance Sizes:
- EC2 instances **generally double** in price and key attributes

## Instance Profiles
- Instead of embedding aws credentials(Access Key and Secrets) in your code so your instance has permissions to access certain services you can **Attach a role to a instance** via **Instance Profiles**
- You want **Avoid embedding your AWS credentials in your code** when possible
- An instance profile holds a reference to a role, the EC2 instance is associated with the instance profile

## Placement Groups
- Placement Groups let you choose the **logical placement** of your instances to optimize for communication, performance or durability. Placement groups are free

## Userdata
- Is a script that automatically runs when lauching an EC2 instance --> You could install packge, apply updates or anything you like

## Metadata
- From within your EC2 instance, you can access the information about the EC2 via a special endpoint at: **169.254.169.254**
