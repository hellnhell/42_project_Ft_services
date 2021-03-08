# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emartin- <emartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 12:52:11 by emartin-          #+#    #+#              #
#    Updated: 2021/03/05 14:24:24 by emartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

#MAINTAINER emartin <emartin-@student.42madrid.com>

RUN 	apk add nginx openssl openssh && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		mkdir -p /run/nginx && \
		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 -subj "/C=SP/ST=Spain/L=Madrid/O=42school/CN=127.0.0.1" \
		-keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt && \
		openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048

RUN	sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  	&& echo "root:toor" | chpasswd \
  	&& rm -rf /var/cache/apk/* \
  	&& sed -ie 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
  	&& sed -ri 's/#HostKey \/etc\/ssh\/ssh_host_key/HostKey \/etc\/ssh\/ssh_host_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_rsa_key/HostKey \/etc\/ssh\/ssh_host_rsa_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_dsa_key/HostKey \/etc\/ssh\/ssh_host_dsa_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ecdsa_key/HostKey \/etc\/ssh\/ssh_host_ecdsa_key/g' /etc/ssh/sshd_config \
  	&& sed -ir 's/#HostKey \/etc\/ssh\/ssh_host_ed25519_key/HostKey \/etc\/ssh\/ssh_host_ed25519_key/g' /etc/ssh/sshd_config \
  	&& /usr/bin/ssh-keygen -A \
  	&& ssh-keygen -t rsa -b 4096 -f  /etc/ssh/ssh_host_key

COPY	/srcs/sshd_config			/etc/ssh/
COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/nginx.conf			/etc/nginx/
COPY	/srcs/ssl_params.conf		/etc/nginx/
COPY	/srcs/index.html			/var/www/
COPY	/srcs/start.sh				/

EXPOSE	80 443 22

ENTRYPOINT sh start.sh