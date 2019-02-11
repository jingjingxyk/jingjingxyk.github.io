---
title: kubeadmin-init
date: 2019-02-11 10:27:38
tags:
---

##kubeadm init 
```bash
kubeadm init \
--kubernetes-version=1.13.3 \
--pod-network-cidr=10.244.0.0/16 \
--token-ttl 0 \
--apiserver-advertise-address=192.168.56.102 \
--v=3 \
--node-name=kunkun \
--ignore-preflight-errors=all


```

```bash
kubeadm init --kubernetes-version=v1.11.1 --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.199.104
--external-etcd-endpoints

kubeadm token create --ttl 0 --print-join-command

kubeadm join 192.168.199.104:6443 --token nxxqbt.ahqhg9xnoeh1pkzq --discovery-token-ca-cert-hash sha256:3320ead0080eadefd71398ad655d40c0e84363870e343b6a04ea07e12b8315c0 --feature-gates CoreDNS=true

docker pull jingjingxyk/dockerfile-k8s:pause
docker tag jingjingxyk/dockerfile-k8s:pause k8s.gcr.io/pause:3.1
 k8s.gcr.io/pause-amd64:3.1
 
 k8s.gcr.io/coredns:1.1.3
 k8s.gcr.io/coredns:1.1.3 
                                            
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

```