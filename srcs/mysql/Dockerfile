# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emartin- <emartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 12:51:45 by emartin-          #+#    #+#              #
#    Updated: 2021/03/08 12:26:36 by emartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

#MAINTAINER emartin <emartin-@student.42madrid.com>
#en realidad no lo estamos abriendo con openrc!!

RUN 	apk add mariadb mariadb-client openrc\
		&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache\
		&& mkdir -p run/mysqld/ 

COPY	/srcs/telegraf.conf		/etc/telegraf/
COPY	/srcs/my.cnf			/etc/
COPY 	/srcs/start.sh			/
COPY	/srcs/wordpress.sql		/


EXPOSE 3306

ENTRYPOINT sh start.sh