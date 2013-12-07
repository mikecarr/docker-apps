# VERSION 0.1

FROM ubuntu 

MAINTAINER Mike Carr mcarr67@gmail.com

# see https://github.com/dotcloud/docker/issues/1024, Docker.IO replaces default /sbin/init with it's own
RUN dpkg-divert --local --rename --add /sbin/initctl

# make sure the package repository is up to date and get prereqs
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -q -y wget erlang-nox logrotate supervisor openssh-server 

# debugging tools
RUN apt-get install telnet lsof netbase


RUN wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.1.5/rabbitmq-server_3.1.5-1_all.deb

ADD add_user.sh /app/

# install rabbit 
#RUN apt-get install -y rabbitmq-server  
RUN dpkg -i rabbitmq-server*.deb
RUN rm -f rabbitmq-server*.deb

RUN rabbitmq-plugins enable rabbitmq_management

# ssh stuff
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
ADD   ./supervisord.conf /etc/supervisor/supervisord.conf

# expose memcached port
EXPOSE 5672 
EXPOSE 15672
EXPOSE 22 

ENTRYPOINT ["/app/add_user.sh"]



