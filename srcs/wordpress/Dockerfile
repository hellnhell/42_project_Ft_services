FROM alpine:3.12

MAINTAINER emartin <emartin-@student.42madrid.com>

RUN  	apk update apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session 

#RUN		mkdir -p /usr/share/webapps/ && cd /usr/share/webapps 
RUN		wget https://www.wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN		mkdir -p /var/www && mv /wordpress /var/www/

COPY	/srcs/wp-config.php			/var/www/wordpress/

EXPOSE 80

#CMD [ "php" "-S" "0.0.0.0:5050" "-t" "/var/www/wordpress/]