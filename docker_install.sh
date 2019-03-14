#!/usr/bin/env bash

# All steps below are executed based on official documentation https://docs.docker.com/install/linux/docker-ce/ubuntu/
# Update the apt package index
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

# set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package index
sudo apt-get update

# Install the latest version of Docker CE and containerd
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io

# Create the docker group
sudo groupadd docker

# Add your user to the docker group
sudo usermod -aG docker ubuntu

# enable Docker on startup
sudo systemctl enable docker

# check Docker isntallation
docker --version

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose