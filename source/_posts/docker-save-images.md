---
title: docker-save-images
date: 2019-02-11 10:29:20
tags:
---

```bash
docker images > /root/images.txt
awk '{print $1,print $2}' /root/images.txt > /root/kolla/images_cut.txt

docker save -o k8s.io.tar \
k8s.gcr.io/kube-apiserver:v1.13.3 \
k8s.gcr.io/kube-proxy:v1.13.3 \
k8s.gcr.io/kube-controller-manager:v1.13.3 \
k8s.gcr.io/kube-scheduler:v1.13.3 \
k8s.gcr.io/coredns:1.2.6 \
k8s.gcr.io/etcd:3.2.24 \
k8s.gcr.io/pause:3.1 

```