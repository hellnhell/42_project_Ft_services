# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emartin- <emartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 12:51:59 by emartin-          #+#    #+#              #
#    Updated: 2021/02/16 12:52:02 by emartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/grafana.db			/usr/share/grafana/data/
COPY	/srcs/start.sh				/


WORKDIR		/usr/share/grafana

EXPOSE		3000

ENTRYPOINT	sh /start.sh