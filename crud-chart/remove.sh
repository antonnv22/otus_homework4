#!/usr/bin/env sh

kubectl delete ns crud
kubectl delete ns prometheus-operator
kubectl delete ns ingress-nginx
kubectl delete ns postgres-exporter