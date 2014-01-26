
FROM ubuntu:12.04

MAINTAINER Mike Carr "mcarr67@gmail.com"

ADD	startup.sh	/app/
ENV	DEBIAN_FRONTEND noninteractive
RUN	echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# Upstart work around
RUN	dpkg-divert --local --rename --add /sbin/initctl
RUN	ln -s /bin/true /sbin/initctl

# install dependencies
RUN	apt-get update
RUN	apt-get -y install python-software-properties software-properties-common wget vim supervisor openssh-server


# add PostgreSQL's repo
RUN     wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN     echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get update

# install PostgreSQL
RUN	apt-get -y install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

RUN	mkdir /var/run/sshd
RUN	echo 'root:password' | chpasswd

ADD     ./supervisord.conf /etc/supervisor/supervisord.conf
ADD	./config/pg_hba.conf /etc/postgresql/9.3/main/
ADD	./config/postgresql.conf /etc/postgresql/9.3/main/
#ADD	./config/environment /etc/postgresql/9.3/main/
#ADD	./config/pg_ctl.conf /etc/postgresql/9.3/main/
#ADD	./config/pg_ident.conf /etc/postgresql/9.3/main/
#ADD	./config/start.conf /etc/postgresql/9.3/main/

RUN	chown -R postgres:postgres /etc/postgresql/9.3/main/*

EXPOSE  5432
EXPOSE  22

ENTRYPOINT ["/app/startup.sh"]

