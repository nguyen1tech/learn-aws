# SSM Parameter Store
Provide secure and hierachical storage for configuration data management and secrets management. You can store data such as passwords, database strings, Amazon Machine Image IDs and license codes as parameter values. You can store values as plaintext or encrypted data

## Features
- Change notification
- Organize parameters
- Label versions
- Data validation
- Reference Secrets
- Accessible from other AWS services
- Integrate with other AWS services

## Parameter Policies
- Parameter Policies are helpful in **forcing you to update or delete passwords**
- You can assign multiple policies to a parameter
 - Expiration: Delete a parameter after a specified date and time
 - ExpirationNotification: Triggers an event in Amazon CloudWatch events that notify you about the upcoming expiration
 - NoChangeNotification: Triggers an event in Amazon CloudWatch if a parameter has not been modified for a specified period of time eg: useful when a password needs to be changed within a specified time

## Types
- String just a string
- StringList comma separate string
- SecureString encrypted string with KMS

## Commands
```
aws ssm put-parameter --name "/planets/vulcan/population" --value 4.9B --type String
aws ssm put-parameter --name "/planets/vulcan/gravity" --value 1.4G --type String
aws ssm put-parameter --name "/planets/vulcan/classification" --value M --type String

aws ssm get-parameters-by-path --path /planets/vulcan
{
    "Parameters": [
        {
            "Name": "/planets/vulcan/classification",
            "Type": "String",
            "Value": "M",
            "Version": 1,
            "LastModifiedDate": "2023-05-26T23:11:51.728000+07:00",
            "ARN": "arn:aws:ssm:ap-southeast-1:726272708354:parameter/planets/vulcan/classification",
            "DataType": "text"
        },
        {
            "Name": "/planets/vulcan/gravity",
            "Type": "String",
            "Value": "1.4G",
            "Version": 1,
            "LastModifiedDate": "2023-05-26T23:11:43.636000+07:00",
            "ARN": "arn:aws:ssm:ap-southeast-1:726272708354:parameter/planets/vulcan/gravity",
            "DataType": "text"
        },
        {
            "Name": "/planets/vulcan/population",
            "Type": "String",
            "Value": "4.9B",
            "Version": 1,
            "LastModifiedDate": "2023-05-26T23:11:35.118000+07:00",
            "ARN": "arn:aws:ssm:ap-southeast-1:726272708354:parameter/planets/vulcan/population",
            "DataType": "text"
        }
]

aws ssm delete-parameter --name /planets/vulcan/classification
```
