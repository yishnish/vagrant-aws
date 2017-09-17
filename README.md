### Configuration for an EC2 instance

#### This should give you:
-  Java 8
-  RVM
-  Ruby (latest)
-  Node, NPM
-  Docker-CE

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

#### To start up an nginx proxy in a docker container that proxies to other docker containers:
-  sh docker-nginx-proxy-init.sh 
-  run your docker containers with the environment variable VIRTUAL_HOST=subdomain.domain.tld AND make sure the container is built to EXPOSE the port you want nginx to proxy to.
-  https://github.com/jwilder/nginx-proxy

#### SSL:
-  Certbot (https://certbot.eff.org/#ubuntuxenial-nginx) should be installed for you
-  Run ```sudo certbot --nginx certonly``` to get certificates for the nginx proxy

#### NOTE:
-  Installing certbot looks like it leaves an nginx server running, so before youc an bring up the nginx reverse proxy you have to kill the cerbot nginx server (port 80 conflict)
