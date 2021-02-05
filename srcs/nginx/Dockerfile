
FROM alpine:3.12

#MAINTAINER emartin <emartin-@student.42madrid.com>

#create a ssl certificate and a self key
#create a DH group -out
RUN 	apk add nginx openssl openssh && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		mkdir -p /run/nginx && \
		openssl req -x509 -nodes -days 365 \ 
		-newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42school/CN=127.0.0.1" \
		-keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt && \
		openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048

RUN		ssh-keygen -A

COPY	/srcs/sshd_config			/etc/ssh/
COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/nginx.conf			/etc/nginx/
COPY	/srcs/ssl_params.conf		/etc/nginx/
COPY	/srcs/index.html			/var/www/

EXPOSE	80 443 22

CMD 	["nginx", "-g", "daemon off;"]