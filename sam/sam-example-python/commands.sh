# create s3 bucket
aws s3 mb s3://bac-sam-code

# package cloudformation
aws cloudformation package --s3-bucket bac-sam-code --template-file template.yaml --output-template-file gen/template-generated.yaml

# deploy sam
aws cloudformation deploy --template-file gen/template-generated.yaml --stack-name hello-word-sam --capabilities CAPABILITY_IAM

# delete
aws cloudformation delete-stack --stack-name hello-world-sam