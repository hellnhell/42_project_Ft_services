#! /bin/sh 
mariadb-install-db -u root 
mysqld -u root & sleep 5 #crea el socket

mysql << EOF 
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'root'@'%' IDENTIFIED BY 'PASSWORD';
GRANT ALL ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'PASSWORD' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

mysql -u root wordpress < wordpress.sql

#mysql -u root -p

#sleep infinite