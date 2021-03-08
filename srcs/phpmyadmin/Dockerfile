
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emartin- <emartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 12:51:36 by emartin-          #+#    #+#              #
#    Updated: 2021/02/17 13:20:39 by emartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    alpine:3.12

RUN		apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
		tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz && \
		mkdir -p /www /etc/telegraf && mv phpMyAdmin-4.9.2-all-languages /www/phpmyadmin

RUN 	apk add nginx openssl openssh && \
		mkdir -p /run/nginx && \
		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42school/CN=127.0.0.1" \
		-keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt && \
		openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/config.inc.php		/www/phpmyadmin/
COPY	/srcs/nginx.conf			/etc/nginx/
COPY	/srcs/ssl_params.conf		/etc/nginx/
COPY	/srcs/start.sh				/

EXPOSE	5000

ENTRYPOINT sh start.sh