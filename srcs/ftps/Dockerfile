# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emartin- <emartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/08 11:14:59 by emartin-          #+#    #+#              #
#    Updated: 2021/03/08 14:44:10 by emartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && apk add vsftpd openssl && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
		
#User
RUN     echo -e "user\nuser" | adduser user -h /ftps_user;
RUN     chown user:user /ftps_user
RUN     touch /var/log/vsftpd.log
RUN     echo "user" >> /etc/vsftpd/vsftpd.userlist

#SSL
RUN     openssl req -x509 -out /etc/ssl/certs/vsftpd.crt -keyout /etc/ssl/private/vsftpd.key -newkey rsa:2048 -nodes -sha256 -subj '/CN=localhost'

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/start.sh				/


EXPOSE	20 21 31000

ENTRYPOINT	sh start.sh
