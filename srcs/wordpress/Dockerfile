# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emartin- <emartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 12:52:22 by emartin-          #+#    #+#              #
#    Updated: 2021/03/05 13:54:38 by emartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

#MAINTAINER emartin <emartin-@student.42madrid.com>

RUN  	apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
RUN 	apk add nginx openssl openssh && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		mkdir -p /run/nginx && \
		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42school/CN=127.0.0.1" \
		-keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt && \
		openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048

RUN		mkdir -p /usr/share/webapps/ && cd /usr/share/webapps 
RUN		wget https://www.wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN		mkdir -p /var/www && mv /wordpress /var/www/

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/wp-config.php			/var/www/wordpress/
COPY	/srcs/nginx.conf			/etc/nginx/
COPY	/srcs/ssl_params.conf		/etc/nginx/
COPY	/srcs/start.sh				/


EXPOSE 5050

ENTRYPOINT sh start.sh