# Build Docker image with Packer that have nginx installed and is uploaded to Docker HUB. Kitchen test is included

## Prerequisites

#### Software requirenments

* packer
* docker
* docker hub account
* kitchen

#### Clone repo and got to the repo directory
  
```
git clone git@github.com:achuchulev/packer-docker-nginx.git
cd packer-docker-nginx/
```

#### Update packer _[template.json](https://github.com/achuchulev/packer-docker-nginx/blob/master/template.json)_ to specify your Docker Hub repo name and release tag for the new image 
   
```
"repository": "achuchulev/packer-nginx",
"tag": "nginx-0.1"
```
    
#### Update _[.kitchen.yml](https://github.com/achuchulev/packer-docker-nginx/blob/master/.kitchen.yml)_ file to match your Docker image to be test

`image: achuchulev/packer-nginx:nginx-0.1`
  
## Build docker image and push it to Docker Hub
   
```
sudo packer validate template.json
sudo docker login -u <docker_hub_user> -p <docker_hub_pass>
sudo packer build template.json
```

## Test that nginx is installed on the image

### on Linux

#### Prerequisit

* kitchen-docker driver installed

run: `gem install kitchen-docker`

#### Run the test

`sudo kitchen test`

### on MAC


#### Install rbenv to use ruby version 2.3.1

```
brew install rbenv
rbenv install 2.3.1
rbenv local 2.3.1
rbenv versions
```

#### Add the following lines to your ~/.bash_profile:

```
eval "$(rbenv init -)"
true
export PATH="$HOME/.rbenv/bin:$PATH"
```

#### Reload profile: 

`source ~/.bash_profile`

#### Install bundler

```
gem install bundler
bundle install
```

#### Run the test: 

`bundle exec kitchen test`
