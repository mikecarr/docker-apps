
FROM base

MAINTAINER Mike Carr "mcarr67@gmail.com"

ADD	setup_start.sh /app/

ENV	DEBIAN_FRONTEND noninteractive
RUN	echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN	echo "mariadb-server-mariadb mysql-server/root_password password docker" | debconf-set-selections
RUN	echo "mariadb-server mysql-server/root_password_again password docker" | debconf-set-selections

# Upstart work around
RUN	dpkg-divert --local --rename --add /sbin/initctl
RUN	ln -s /bin/true /sbin/initctl

RUN	apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
RUN	apt-get update
RUN	apt-get -y install python-software-properties
RUN	add-apt-repository 'deb http://mirror.jmu.edu/pub/mariadb/repo/10.0/ubuntu precise main'
RUN	apt-get update

RUN	apt-get -y install python-software-properties supervisor openssh-server mariadb-server
RUN	sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf

RUN	mkdir /var/run/sshd
ADD     ./supervisord.conf /etc/supervisor/supervisord.conf
RUN	echo 'root:password' | chpasswd

# Adding this will expose mysql on a random host port. It's recommended to avoid this. Other containers on the same 
# host can use the service without it.
EXPOSE	3306
EXPOSE	22

CMD ["/bin/bash", "/app/setup_start.sh"]

