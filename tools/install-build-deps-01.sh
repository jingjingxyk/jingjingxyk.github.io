#!/bin/bash

set -exu

__DIR__=$(cd "$(dirname "$0")";pwd)
cd ${__DIR__}

cat /etc/os-release
echo $(id -u)
echo $(id -g)

sudo apt update -y
sudo apt install -y build-essential gcc g++ cmake
sudo apt install -y libssl-dev ca-certificates  git curl wget make cmake gcc g++ python3 python3-pip python3-dev ninja-build
sudo apt install -y ffmpeg aria2
sudo apt install -y iputils-ping net-tools dnsutils iproute2 procps iputils-ping lsof
sudo apt install -y tcpdump nmap traceroute  mtr
sudo apt install -y gettext lrzsz
sudo apt install -y xz-utils zip unzip


# prepare docker

sudo apt install -y   ca-certificates  curl gnupg  gnupg2  gnupg1  lvm2  lsb-release apt-transport-https  curl sudo
mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install -y  docker-ce docker-ce-cli containerd.io docker-compose-plugin

#sudo curl -fsSL https://get.docker.com -o get-docker.sh
#sudo bash get-docker.sh
