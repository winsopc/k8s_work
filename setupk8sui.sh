#!/bin/bash
#kubectl create -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/influxdb.yaml
#kubectl create -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/grafana.yaml
#kubectl create -f https://raw.githubusercontent.com/kubernetes/heapster/master/deploy/kube-config/influxdb/heapster.yaml
kubectl create -f influxdb.yaml -f grafana.yaml -f heapster.yaml
kubectl create -f ClusterRoleBinding.yaml
kubectl apply -f heapster-clusterrole.yaml
kubectl create -f heapster-rbac.yaml
#already modify the heapster role to use node/stats and security to use
sleep 10
kubectl create -f kubernetes-dashboard.yaml
kubectl create -f dashboard-adminuser.yaml
