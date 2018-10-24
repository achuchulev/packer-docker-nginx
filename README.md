# Build Docker image with Packer that have nginx installed and is uploaded to Docker HUB. Kitchen test is included

## Prerequisites

#### Software requirenments

* packer
* docker
* docker hub account
* kitchen
* virtualbox

## Build docker image

#### To _build_ and _test_ Docker image the following GitHub repo [Ubuntu Xenial - Vagrant box with docker installed](https://github.com/kikitux/xenial-docker) is used to run xenial Vagrant box that has docker, packer and kitchen pre-installed

#### Clone GitHub repo, start and ssh to the virtualbox VM

```
git clone https://github.com/kikitux/xenial-docker.git
cd xenial-docker/
vagrant up
vagrant ssh
```

#### From VM CLI clone repo and got to the repo directory
  
```
git clone https://github.com/achuchulev/packer-docker-nginx.git
cd packer-docker-nginx/
```

#### Update below lines within packer _[template.json](https://github.com/achuchulev/packer-docker-nginx/blob/master/template.json)_ to specify your Docker Hub repo name and release tag for the new image 
   
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

    
#### Update below line within _[.kitchen.yml](https://github.com/achuchulev/packer-docker-nginx/blob/master/.kitchen.yml)_ file to match your Docker image to be test

`image: achuchulev/packer-nginx:nginx-0.1`

#### Run the test to verify that nginx is installed

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
