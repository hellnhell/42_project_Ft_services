#!/bin/sh

minikube delete
killall -TERM kubectl minikube VBoxHeadless

minikube start --cpus=2 --memory 4000 --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000

eval $(minikube docker-env)

docker build -t my_nginx srcs/nginx  > /dev/null 2>&1
docker build -t my_mysql srcs/mysql > /dev/null 2>&1
docker build -t my_phpmyadmin srcs/phpmyadmin  > /dev/null 2>&1
docker build -t my_wordpress srcs/wordpress  > /dev/null 2>&1
docker build -t my_grafana srcs/grafana  > /dev/null 2>&1
docker build -t my_influxdb srcs/influxdb  > /dev/null 2>&1



#MetalLb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl apply -f srcs/metalLB.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/phpmyadmin.yaml
kubectl apply -f srcs/wordpress.yaml
kubectl apply -f srcs/grafana.yaml
kubectl apply -f srcs/influxdb.yaml




