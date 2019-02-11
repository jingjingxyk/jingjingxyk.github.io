---
title: kubernetes-setup
date: 2019-02-11 10:34:15
tags:
---

## centos7 kubernetes 安装

```bash

#!/usr/bin/env bash
#docker kubernetes 软件包镜像 https://mirrors.aliyun.com
#centos7 kubernetes 安装
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

wget https://mirrors.aliyun.com/docker-toolbox/linux/compose/1.21.1/docker-compose-Linux-x86_64 -O /usr/local/bin/docker-compose

chmod a+x /usr/local/bin/docker-compose

systemctl stop firewalld
systemctl disable firewalld

systemctl enable docker.service
systemctl start docker.service

modprobe br_netfilter

echo "net.bridge.bridge-nf-call-ip6tables = 1 " >> /etc/sysctl.conf
echo "net.bridge.bridge-nf-call-iptables = 1 " >> /etc/sysctl.conf

sysctl -p

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
EOF

setenforce 0
yum install -y kubelet kubeadm kubectl

systemctl enable kubelet && systemctl start kubelet

list=$(kubeadm config images list --kubernetes-version=1.12.2)
for line in ${list}
do
    docker pull  $line
done

#yum list kubeadm  --showduplicates |sort -r

kubeadm init \
--kubernetes-version=1.12.2 \
--pod-network-cidr=10.244.0.0/16 \
--token-ttl 0 \
--apiserver-advertise-address=172.21.116.114 \
--v=3 \
--node-name=kunkun \
--ignore-preflight-errors=all

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get pods --all-namespaces

#minikube start  --vm-driver virtualbox --kubernetes-version v1.12.2 -v 3

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml

#docker save $(docker images | grep -v REPOSITORY | awk 'BEGIN{OFS=":";ORS=" "}{print $1,$2}') -o kubernetes.images.tar







```