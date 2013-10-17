MYSQL_PASSWORD=docker
DATABASE_NAME=docker
DATABASE_USER=docker
DB_USER_PASSWD=docker

#mysql has to be started this way as it doesn't work to call from /etc/init.d
echo "start mysql"
/usr/bin/mysqld_safe & 
sleep 10s

echo "setup mysql"
mysql -uroot -p$MYSQL_PASSWORD -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'localhost' IDENTIFIED BY '$DB_USER_PASSWD'; FLUSH PRIVILEGES;"
mysql -uroot -p$MYSQL_PASSWORD -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD'; FLUSH PRIVILEGES;"

echo "killing mysqld"
killall mysqld
sleep 10s

echo "launch supervisord"
supervisord -n

