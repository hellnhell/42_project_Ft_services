
FROM    alpine:3.12

RUN     apk update add openrc
RUN     apk add wget php php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session && \
        wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz &&\
        mkdir -p /www/phpMyAdmin && tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz  &&\
        mv phpMyAdmin-4.9.2-all-languages /www/phpMyAdmin &&\
		rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz

COPY	srcs/config.inc.php		/www/phpMyAdmin/


EXPOSE	5000

CMD php -S 0.0.0.0:5000 -t /www/phpMyAdmin/