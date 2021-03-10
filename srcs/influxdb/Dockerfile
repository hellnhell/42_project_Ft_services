# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emartin- <emartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 12:51:53 by emartin-          #+#    #+#              #
#    Updated: 2021/03/09 13:54:24 by emartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN 	apk update && apk add openrc --no-cache && apk add influxdb &&\
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		openrc && touch /run/openrc/softlevel && \
		rc-update add telegraf

COPY	/srcs/telegraf.conf		/etc/
COPY	/srcs/start.sh			/

EXPOSE	8086

ENTRYPOINT sh start.sh