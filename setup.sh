#!/bin/bash
# This script prepares an empty Ubuntu 18.04.01 LTS server for deploying OPAL.
# Prerequisites:
# - su permission
# Installs:
# - docker-ce (and its prerequisites, according to https://docs.docker.com/install/linux/docker-ce/ubuntu as of 29.10.2018)
# - docker-compose

# 1. download and install docker

curl -fsSL https://get.docker.com -o get-docker.sh

sudo sh get-docker.sh

# 2. add opaladmin to docker group

sudo usermod -aG docker opaladmin

# 3. run docker on startup

sudo systemctl enable docker

# 4. install docker-compose - NOTE: this command might be outdated, check for newer version

sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 5. make docker-compose executable

sudo chmod +x /usr/local/bin/docker-compose

# 6. add compose bash completion

sudo curl -L https://raw.githubusercontent.com/docker/compose/1.22.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# 7. test installation
echo "\nIf the installation was successful, the following test command should print the docker-compose version:"
docker-compose --version
