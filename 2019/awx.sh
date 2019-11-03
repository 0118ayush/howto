#!/bin/bash

apt install -y ansible docker.io docker-compose git python3-docker

systemctrl enable docker
systemcrrl start docker

update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
update-alternatives --install /usr/bin/python python /usr/bin/python3 2

#clone awx
cd ~
git clone https://github.com/ansible/awx
cd ~/awx/installer
