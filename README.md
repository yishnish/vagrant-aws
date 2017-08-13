### Configuration for an EC2 instance

#### You will need:
-  Access Key ID -> AWS_ACCESS_KEY_ID
    -  Security, Identity & Compliance -> IAM -> Users -> <user> -> Security Credentials tab (to create a new one)
-  Secret Access Key -> AWS_SECRET_ACCESS_KEY
    -  You get it when you generate your Access Key
-  SSH Keypair Name -> AWS_KEYPAIR_NAME
    -  The name of the .pem file you can generate on AWS. Possibly the name of your public or private SSH key if you upload one?
-  SSH username to connect with (defaults to 'ubuntu') -> AWS_SSH_USERNAME
-  Path to the private SSH key you're using (the .pem file if you're using that) -> AWS_PRIVATE_KEY_PATH
-  An ID for the AMI you want to use (you possibly have to go part way through the launch wizard before you can see
the ID for an AMI) -> AMI_ID
-  Pick a region you want to launch in -> EC2_INSTANCE_REGION
-  Know what security groups you want to apply -> EC2_INSTANCE_SECURITY_GROUPS
-  Instance type -> EC2_INSTANCE_TYPE
-  Name for your launched instance (assuming you're only making the one) -> EC2_INSTANCE_NAME

#### Then:
Put all that stuff in the appropriate environment variables

#### Then:
vagrant up
