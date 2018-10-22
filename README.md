# A Packer template that builds a Docker image with built-in nginx server which is being uploaded to Docker HUB

### Prerequisites

* packer
* docker
* docker hub account
* kitchen

#### Get the repo and got to the repo directory
  
   ```
   git clone git@github.com:achuchulev/packer-docker-nginx.git
   cd packer-docker-nginx/
   ```

#### Update the following lines to match your Docker Hub repo and tag

  * [template.json](https://github.com/achuchulev/packer-docker-nginx/blob/master/template.json)
   
    ```
    "repository": "achuchulev/packer-nginx",
    "tag": "nginx-0.1"
    ```

  * [.kitchen.yml](https://github.com/achuchulev/packer-docker-nginx/blob/master/.kitchen.yml)

    `image: achuchulev/packer-nginx:nginx-0.1`
    
  
## Build docker image and push it to Docker Hub
   
  ```
  sudo packer validate template.json
  sudo docker login -u <docker_hub_user> -p <docker_hub_pass>
  sudo packer build template.json
  ```

## Test that nginx is installed on the image

* Manual

  ```
  sudo kitchen converge
  sudo kitchen verify
  sudo kitchen destroy
  ```

* Automatic

  `sudo kitchen test`
