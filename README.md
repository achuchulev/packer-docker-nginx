# Packer template to build a docker image with nginx that is uploaded to Docker HUB

### Prerequisit

* packer
* docker
* docker hub account

### How to build docker image

```

git clone git@github.com:achuchulev/packer-docker-nginx.git
cd packer-docker-nginx/
sudo packer validate template.json
sudo docker login -u <docker_hub_user> -p <docker_hub_pass>
sudo packer build template.json

```

