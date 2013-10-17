
MYSQL_PASSWORD=password
DATABASE_NAME=docker
DATABASE_USER=docker
DB_USER_PASSWD=docker

#mysql has to be started this way as it doesn't work to call from /etc/init.d
/usr/bin/mysqld_safe & 
sleep 10s

/usr/sbin/sshd -D &
sleep 5s 

mysqladmin -u root password $MYSQL_PASSWORD
mysql -uroot -p$MYSQL_PASSWORD -e "CREATE DATABASE $DATABASE_NAME; GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'localhost' IDENTIFIED BY '$DB_USER_PASSWD'; FLUSH PRIVILEGES;"
killall mysqld
sleep 10s
fi
supervisord -n

