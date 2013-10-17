
FROM ubuntu:12.04

MAINTAINER Mike Carr "mcarr67@gmail.com"

ADD	./startup.sh	/app/
ENV	DEBIAN_FRONTEND noninteractive
RUN	echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Upstart work around
RUN	dpkg-divert --local --rename --add /sbin/initctl
RUN	ln -s /bin/true /sbin/initctl

RUN	apt-get update
RUN	apt-get -y install wget default-jre-headless supervisor openssh-server
RUN	wget ftp://apache.mirrors.pair.com/tomcat/tomcat-6/v6.0.37/bin/apache-tomcat-6.0.37.tar.gz
RUN	tar xvzf apache-tomcat-6.0.37.tar.gz
RUN	mv apache-tomcat-6.0.37 /usr/share/tomcat6

RUN	mkdir /var/run/sshd
RUN	echo 'root:password' | chpasswd

ADD     ./supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE  8080	
EXPOSE  22

CMD ["/bin/bash", "/app/startup.sh"]

