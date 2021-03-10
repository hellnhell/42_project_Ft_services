
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emartin- <emartin-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/16 12:53:53 by emartin-          #+#    #+#              #
#    Updated: 2021/02/16 12:53:58 by emartin-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

telegraf &
mariadb-install-db -u root 
mysqld -u root & sleep 5 #crea el socket

mysql << EOF 
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'root'@'%' IDENTIFIED BY 'PASSWORD';
GRANT ALL ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'toor' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

if [ ! -f /var/lib/mysql/wordpress ]; then
	mysql -u root wordpress < wordpress.sql
fi
tail -f /dev/null

#mysql -u root -p

sleep infinite