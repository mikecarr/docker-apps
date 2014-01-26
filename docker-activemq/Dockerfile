# VERSION 0.1

FROM ubuntu 

MAINTAINER Mike Carr mcarr@qualcomm.com

# see https://github.com/dotcloud/docker/issues/1024, Docker.IO replaces default /sbin/init with it's own
RUN dpkg-divert --local --rename --add /sbin/initctl

# make sure the package repository is up to date and get prereqs
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -q -y wget supervisor openjdk-7-jre-headless openssh-server

RUN [ -d /opt/activemq ] || mkdir /opt/activemq

RUN wget http://psg.mtu.edu/pub/apache/activemq/apache-activemq/5.8.0/apache-activemq-5.8.0-bin.tar.gz

RUN tar xvzf apache-activemq-5.8.0-bin.tar.gz

RUN mv apache-activemq-5.8.0 /opt/activemq

#clean up
RUN rm apache-activemq-5.8.0-bin.tar.gz

ADD create-instance.sh /app/

RUN	mkdir /var/run/sshd
ADD     ./supervisord.conf /etc/supervisor/supervisord.conf
RUN	echo 'root:password' | chpasswd

EXPOSE 61616
EXPOSE 8161
EXPOSE 22

ENTRYPOINT ["/app/create-instance.sh"]

