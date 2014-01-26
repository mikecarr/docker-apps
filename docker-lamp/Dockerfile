
FROM ubuntu:12.04

MAINTAINER Mike Carr "mcarr67@gmail.com"

ADD	./startup.sh	/app/
ADD	./info.php	/var/www/

ENV	DEBIAN_FRONTEND noninteractive
ENV 	APACHE_RUN_USER www-data
ENV 	APACHE_RUN_GROUP www-data
ENV 	APACHE_LOG_DIR /var/log/apache2

RUN	echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list ; 
RUN	echo "mysql-server-5.5 mysql-server/root_password password docker" | debconf-set-selections ;    echo "mysql-server-5.5 mysql-server/root_password_again password docker" | debconf-set-selections;	echo 'phpmyadmin phpmyadmin/app-password-confirm password docker' | debconf-set-selections ;     echo 'phpmyadmin phpmyadmin/mysql/admin-pass password docker' | debconf-set-selections ;     echo 'phpmyadmin phpmyadmin/password-confirm password docker' | debconf-set-selections ;     echo 'phpmyadmin phpmyadmin/setup-password password docker' | debconf-set-selections ;     echo 'phpmyadmin phpmyadmin/database-type select mysql' | debconf-set-selections ;     echo 'phpmyadmin phpmyadmin/mysql/app-pass password docker' | debconf-set-selections;	echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections;	echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections ;	echo 'dbconfig-common dbconfig-common/mysql/app-pass password docker' | debconf-set-selections ;   echo 'dbconfig-common dbconfig-common/mysql/app-pass password' | debconf-set-selections ;     echo 'dbconfig-common dbconfig-common/password-confirm password docker' | debconf-set-selections ;     echo 'dbconfig-common dbconfig-common/app-password-confirm password docker' | debconf-set-selections ;    echo 'dbconfig-common dbconfig-common/app-password-confirm password docker' | debconf-set-selections ;     echo 'dbconfig-common dbconfig-common/password-confirm password docker' | debconf-set-selections

# Upstart work around
RUN	dpkg-divert --local --rename --add /sbin/initctl
RUN	ln -s /bin/true /sbin/initctl

RUN	apt-get update
RUN	apt-get -y install wget default-jre-headless supervisor openssh-server mysql-server apache2 php5 libapache2-mod-php5 php5-mysql 

# install phpmyadmin, needs MySQL running
RUN	echo "start mysql"
RUN	/usr/bin/mysqld_safe &
RUN	sleep 10s

RUN	apt-get -y install phpmyadmin

#RUN	echo "killing mysqld"
#RUN	killall mysqld
#RUN	sleep 10s

RUN     sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
ADD	./apache2.conf	/etc/apache2/apache2.conf

RUN	mkdir /var/run/sshd
RUN	echo 'root:password' | chpasswd

ADD     ./supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE  80
EXPOSE  22

CMD ["/bin/bash", "/app/startup.sh"]

