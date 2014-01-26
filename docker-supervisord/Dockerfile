# sshd
#
# VERSION               0.0.1

FROM      	base
MAINTAINER 	Mike Carr "mcarr@qualcomm.com"

# make sure the package repository is up to date
RUN 		echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN 		apt-get update

RUN 		apt-get install -y openssh-server supervisor
RUN 		mkdir /var/run/sshd 
RUN 		echo 'root:password' |chpasswd

ADD     ./supervisord.conf /etc/supervisor/supervisord.conf

RUN		groupadd supervisor
RUN		usermod -a -G supervisor root

EXPOSE 		22
EXPOSE		9001

CMD ["/usr/bin/supervisord -n"]
