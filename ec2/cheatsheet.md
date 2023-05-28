- EC2 is a cloud computing service
- Configure your EC2 by choosing your **OS, Storage, Memory, Network Throughput**
- Launch and SSH to server within minutes
- EC2 comes in variety of instance types specialized for different roles:
  - **General purpose** balance of compute, memory and networking resources
  - **Compute Optimized** ideal for compute bound applications that benefit from high performance processor
  - **Memory Optimized** fast performance for workloads that process large datasets in memory
  - **Accelerated Optimized** hardware accelerator or co-processor
  - **Storage Optimized** high, sequential read and write access to large datasets on local storage
- Instance sizes generally double in price and key attributes
- Placement groups let you choose the logical placement of your instances to optimize for communication, performance and durability
- Userdata is a script that automatically runs when launching an EC2 instance
- Metadata is a metadata about the current instance.
- Instance profile is a container for **IAM role** that you can use to pass role information to an EC2 instance when the instance starts