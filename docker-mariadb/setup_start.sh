#!/bin/sh

ROOT_PASSWORD=docker
DATABASE_NAME=docker
DATABASE_USER=docker
DB_USER_PASSWD=docker

#has to be started this way as it doesn't work to call from /etc/init.d
echo "start mariadb"
/usr/bin/mysqld_safe & 
sleep 10s

echo "setup mariadb"
mysql -uroot -p$ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'localhost' IDENTIFIED BY '$DB_USER_PASSWD'; FLUSH PRIVILEGES;"
mysql -uroot -p$ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD'; FLUSH PRIVILEGES;"

echo "killing mariadb"
killall mysqld
sleep 10s

echo "launch supervisord"
supervisord -n

