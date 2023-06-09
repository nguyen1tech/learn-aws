# Elastic Beanstalk Cheatsheet

- Elastic Beanstalk handles the deployment, from capacity provisioning, load balancing, auto-scaling to application health monitoring
- When you want to have a web-application but don't want to think about the underlying Infrastructure
- It costs nothing to use Elastic Beanstalk(only the resources it provisions eg: RDS, EC2, ELB)
- Recommended for test or development apps. Not recommended for production use.
- You can choose from the following pre-configured platforms: Java, .NET, Go, Nodejs, PHP, Python, Ruby and Docker.
- You can run containers on EB either in Single-Container or Multi-Container these containers are running on ECS instead of EC2.
- You can launch either **Web-Environment** or **Worker-Environment**
  - Web-Environments: come in 2 types: **Single-Instance** or **Load Balanced**
    - Single-Instance Env: Launches a single EC2 instance, EIP is assigned to the EC2
    - Load Balanced Env: Launch EC2s behind an ELB managed by an ASG
  - Woker-Environment: Creates an SQS queue, installs SQS daemon on the EC2 instances and has ASG policy which will add or remove instances based on the queue size.
- EB has following **deployment policies**:
  - **All at once**: takes all servers out of service, applies changes, put servers back in service -> Fast but has downtime.
  - **Rolling**: updates servers in batches, reduced capacity based on batch size.
  - **Rolling with additional batch**: adds new servers in batches to replace the old -> never reduces the capacity
  - **Immutable**: creates the same amout of servers, and switches all at once to new servers, removing old servers.
- Rolling deployment requires ELB so can not be used with Single-Instance Web Environment.
- In-place deployment is when the deployment occurs within the environment, all deployment policies are In-Place.
- Blue/Green is when deployment swaps environment(outside an environment), when you have external resources such as RDS which can not be destroyed it's suited for Blue/Green.
- **.ebextensions** is a folder which contains all configuration files.
- With **EB** you can provide **Custom Image** which can improve provisioning time.
- **Dockerrun.aws.json** is similar to a ECS Task Definition files and defines multi container configuration
