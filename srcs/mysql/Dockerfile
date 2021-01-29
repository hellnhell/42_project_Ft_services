FROM alpine:3.13

MAINTAINER emartin <emartin-@student.42madrid.com>

RUN 	apk add mariadb mariadb-client && \
		mkdir -p run/mysqld/

COPY	/srcs/my.cnf			/etc/
COPY	/srcs/wordpress.sql		/

