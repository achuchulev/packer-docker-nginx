# Build Docker image with Packer that have nginx installed and is uploaded to Docker HUB. Kitchen test is included

## Prerequisites

* docker hub account
* virtualbox

## Build docker image

#### Clone following GitHub repo to start and ssh to Vagrant box with pre-installed Packer and Docker

```
git clone https://github.com/kikitux/xenial-docker.git
cd xenial-docker/
vagrant up
vagrant ssh
```

#### From Vagrant box clone repo and got to the repo directory
  
```
git clone https://github.com/achuchulev/packer-docker-nginx.git
cd packer-docker-nginx/
```

#### Update _template.json_ with your Docker Hub repo name and release tag for the new image 
   
```
"repository": "achuchulev/packer-nginx",
"tag": "nginx-0.1"
```
   
#### Validate Packer template
`sudo packer validate template.json`

#### Login to Docker Hub
`sudo docker login -u <docker_hub_user> -p <docker_hub_pass>`

#### Build docker image and push it to Docker Hub
`sudo packer build template.json`


## Test Docker image

    
#### Update _.kitchen.yml_ with your Docker image to be test

`image: achuchulev/packer-nginx:nginx-0.1`

#### Run the test to verify that nginx is installed with default configuration

`sudo kitchen test`

_Passing test should look like:_

```
  ✔  nginx-package: System Package nginx should be installed
     ✔  System Package nginx should be installed
  ✔  nginx-config: File /etc/nginx/nginx.conf should exist; File /etc/nginx/ngi...
     ✔  File /etc/nginx/nginx.conf should exist
     ✔  File /etc/nginx/nginx.conf owner should eq "root"
     ✔  File /etc/nginx/nginx.conf mode should cmp == "420"
  ✔  nginx-tls: Nginx Environment support_info should match /TLS/
     ✔  Nginx Environment support_info should match /TLS/

Profile Summary: 3 successful controls, 0 control failures, 0 controls skipped
Test Summary: 5 successful, 0 failures, 0 skipped
```
