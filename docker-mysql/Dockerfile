
FROM ubuntu:12.04

MAINTAINER Mike Carr "mcarr67@gmail.com"

ADD add_mysql_user.sh /app/

ENV	DEBIAN_FRONTEND noninteractive
RUN	echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN	echo "mysql-server-5.5 mysql-server/root_password password docker" | debconf-set-selections
RUN	echo "mysql-server-5.5 mysql-server/root_password_again password docker" | debconf-set-selections

# Upstart work around
RUN	dpkg-divert --local --rename --add /sbin/initctl
RUN	ln -s /bin/true /sbin/initctl

RUN	apt-get update
RUN	apt-get -y install mysql-server supervisor openssh-server
RUN	sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf

RUN	mkdir /var/run/sshd
ADD     ./supervisord.conf /etc/supervisor/supervisord.conf
RUN	echo 'root:password' | chpasswd

# Adding this will expose mysql on a random host port. It's recommended to avoid this. Other containers on the same 
# host can use the service without it.
EXPOSE	3306
EXPOSE	22

CMD ["/bin/bash", "/app/add_mysql_user.sh"]

