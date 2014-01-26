# sshd
#
# VERSION               0.0.1

FROM      	base
MAINTAINER 	Mike Carr "mcarr67@gmail.com"

# make sure the package repository is up to date
RUN 		echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN 		apt-get update

RUN 		apt-get install -y openssh-server
RUN 		mkdir /var/run/sshd 
RUN 		echo 'root:password' |chpasswd

EXPOSE 		22
CMD    		/usr/sbin/sshd -D
