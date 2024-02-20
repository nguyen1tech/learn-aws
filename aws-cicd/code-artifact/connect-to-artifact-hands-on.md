## Python

- AWS CLI
  ```
  aws codeartifact login --tool pip --repository my-python-repo --domain <my_domain> --domain-owner <my_domain_owner> --region ap-southeast-1
  ```
- Manual

  1. Fetch the new authorization token using AWS CLI

     ```
     export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain <my_domain> --domain-owner <my_domain_owner> --region ap-southeast-1 --query authorizationToken --output text`
     ```

  2. Set the CodeArtifact registry

     ```
     pip config set global.index-url https://aws:$CODEARTIFACT_AUTH_TOKEN@<my_domain>-<my_domain_owner>.d.codeartifact.ap-southeast-1.amazonaws.com/pypi/my-python-repo/simple/
     ```
