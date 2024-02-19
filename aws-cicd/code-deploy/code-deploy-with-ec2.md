# Deploy a web server to EC2 instance

1. Create service roles:
   - Code deploy service role for EC2
   - S3 role to pull application code from S3
2. Create an EC2 instance

   - Install CodeDeploy Agent

   ```
   #!/bin/bash

   # Install Code Deploy Agent
   sudo yum update
   sudo yum install ruby

   # Download the agent
   wget https://aws-codedeploy-us-east-2.s3.us-east-2.amazonaws.com/latest/install
   chmod +x ./install
   sudo ./install auto
   sudo service codedeploy-agent status

   ```

3. Upload application code to S3, eg: sample-app-linux.zip
4. Create Code Deploy
   - Create Code Deploy Application
   - Create Code Deploy Deployment Group
   - Create Code Deploy Deployment
5. Issues faced
   - Need to restart codedeploy-agent service after attaching a Role to an EC2 instance
