#!/bin/bash

which curl docker make ruby ruby-dev g++ || {
  sudo apt-get update
  sudo apt-get install -y curl docker.io make ruby ruby-dev g++
  sudo usermod -a -G docker ubuntu
  sudo gem install rubyzip
}

which packer || {
  cd /usr/local/bin
  curl -sSL https://raw.githubusercontent.com/kikitux/download-hashicorp-tools/master/download-packer.rb | sudo ruby
}

sudo gem install test-kitchen
sudo gem install kitchen-docker
sudo gem install -fN kitchen-inspec
