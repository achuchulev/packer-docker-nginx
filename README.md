# Packer template to build a docker image with nginx that is uploaded to Docker HUB

### Prerequisit

* packer
* docker
* docker hub account
* kitchen

### How to build docker image

* Get the repo and got to the repo directory
  
   ```
   git clone git@github.com:achuchulev/packer-docker-nginx.git
   cd packer-docker-nginx/
   ```

* Update the following lines to match your Docker Hub repo

  * template.json 
   
    ```
    "repository": "achuchulev/packer-nginx",
    "tag": "nginx-0.1"
    ```

  * .kitchen.yml

    `image: achuchulev/packer-nginx:nginx-0.1`
    
  
* Build docker image and push it to Docker Hub
   
```
sudo packer validate template.json
sudo docker login -u <docker_hub_user> -p <docker_hub_pass>
sudo packer build template.json
```

### Verify that nginx is installed

#### Manual

```
sudo kitchen converge
sudo kitchen verify
sudo kitchen destroy
```

#### Automatic

`sudo kitchen test`
