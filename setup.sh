#!/bin/sh

minikube delete
killall -TERM kubectl minikube VBoxHeadless

minikube start --cpus=2 --memory 4000 --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000

eval $(minikube docker-env)

printf "♻️   🐳  Building Docker images...\n"
docker build -t my_nginx srcs/nginx >> logs.txt
printf "🐳 🛠  Nginx done...\n" 
docker build -t my_mysql srcs/mysql >> logs.txt
printf "🐳 🛠  MySql done...\n" 
docker build -t my_phpmyadmin srcs/phpmyadmin >> logs.txt
printf "🐳 🛠  PhpMyAdmin done...\n"  
docker build -t my_wordpress srcs/wordpress >> logs.txt
printf "🐳 🛠  Wordpress done...\n" 
docker build -t my_grafana srcs/grafana >> logs.txt
printf "🐳 🛠  Grafana done...\n"  
docker build -t my_influxdb srcs/influxdb >> logs.txt
printf "🐳 🛠  InfluxDB done...\n"
docker build -t my_ftps srcs/ftps >> logs.txt
printf "🐳 🛠  FTPS done...\n"

printf "✅  🐳  Images builded!\n"

printf "♻️  Deploying services...\n"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl apply -f srcs/metalLB.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
printf "🛠  MetalLB done...\n"
kubectl apply -f srcs/nginx.yaml >> logs.txt
printf "🛠  Nginx done...\n"
kubectl apply -f srcs/mysql.yaml >> logs.txt
printf "🛠  MySQL done...\n"
kubectl apply -f srcs/phpmyadmin.yaml >> logs.txt
printf "🛠  PhpMyAdmin done...\n"
kubectl apply -f srcs/wordpress.yaml >> logs.txt
printf "🛠  Wordpress done...\n"
kubectl apply -f srcs/grafana.yaml >> logs.txt
printf "🛠  Grafana done...\n"
kubectl apply -f srcs/influxdb.yaml >> logs.txt
printf "🛠  Influxdb done...\n"
kubectl apply -f srcs/ftps.yaml >> logs.txt
kubectl apply -f srcs/ftps-config.yaml >> logs.txt
printf "🛠  FTPS done...\n"
printf "✅ Deployed!\n"

minikube addons enable dashboard
minikube addons enable metrics-server
minikube dashboard
