
FROM alpine:3.12

#MAINTAINER emartin <emartin-@student.42madrid.com>
#en realidad no lo estamos abriendo con openrc!!

RUN 	apk add mariadb mariadb-client openrc\
		&& mkdir -p run/mysqld/ 


COPY	/srcs/my.cnf			/etc/
COPY	/srcs/wordpress.sql		/
COPY 	/srcs/start.sh			/


EXPOSE 3306

CMD sh start.sh