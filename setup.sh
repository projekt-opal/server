#!/bin/bash
# This script prepares an empty Ubuntu 18.04.01 LTS server for deploying OPAL.
# Prerequisites:
# - su permission
# Installs:
# - docker-ce (and its prerequisites, according to https://docs.docker.com/install/linux/docker-ce/ubuntu as of 29.10.2018)
# - docker-compose
# - python (version 3, for basic http server)

apt-get update

apt-get install apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update

apt-get install docker-ce

docker run hello-world