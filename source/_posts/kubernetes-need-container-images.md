---
title: kubernetes-need-container-images
date: 2019-02-11 10:30:20
tags:
---

## kubernetes v1.13.0 需要的镜像
```bash
docker save -o k8s.io.tar \
k8s.gcr.io/kube-apiserver:v1.13.3 \
k8s.gcr.io/kube-proxy:v1.13.3 \
k8s.gcr.io/kube-controller-manager:v1.13.3 \
k8s.gcr.io/kube-scheduler:v1.13.3 \
k8s.gcr.io/coredns:1.2.6 \
k8s.gcr.io/etcd:3.2.24 \
k8s.gcr.io/pause:3.1 
```
## CND kubernetes 网络接口 和 WEBUI
```bash

docker save -o flannel-nginx-ingress-webui.tar \
quay.io/coreos/flannel:v0.10.0-amd64 \
quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.22.0 \
k8s.gcr.io/kubernetes-dashboard-amd64:v1.10.1 \
traefik:latest 
```

## istio 
```bash
docker save -o istio.tar \
istio/sidecar_injector:1.0.5 \
istio/servicegraph:1.0.5 \
istio/proxyv2:1.0.5 \
istio/pilot:1.0.5 \
istio/mixer:1.0.5 \
istio/galley:1.0.5 \
istio/citadel:1.0.5 \
grafana/grafana:5.2.3 \
prom/prometheus:v2.3.1 \
jaegertracing/all-in-one:1.5 \
quay.io/coreos/hyperkube:v1.7.6_coreos.0


```