
# aws-create-machine

**TASK :** 
Provision an Ubuntu 16.04 server and carry out any configuration steps needed to allow login over ssh, securely and disable password based login, 
Setting up the firewall to only allow ingress on the ssh port and only to allow password-less (certificate) based login then display the MOTD including the text "Hello Assurity DevOps”.

**Pre-Requsists**

 1. AWS cloud account with programmatic key access - 
 2. Install AWS CLI (latest) and configure profile -
 ```sh
[personal] 
aws_access_key_id=AKIAxxxxxxxxxx
aws_secret_access_key=hAxxxxxxxxxxxxxxxxxxxx*
```
 3. Install Terraform latest

**How to**

 1. Creat SSH keys and save it on the SRC/keys folder.(public key should be = assurity_1.pub)
 2. RUN: terraform init (Make sure you didn't get any errors)
 2. RUN: terraform plan (Make sure you didn't get any errors)
 3. RUN: terraform apply (This will create the infastructure in the AWS account.)
 4. SSH to the EC2 instance using the **public IP** which is the out put of the terraform. 
 5. Enjoy!!

**Attachment : Network diagram of the AWS Infastructure**

![alt diagram](https://github.com/sithmal/aws-create-machine/blob/master/Assurity-Network-Diagram.jpg)
