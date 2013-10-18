
## Docker MariaDB

MariaDB - An enhanced, drop-in replacement for MySQL.
https://mariadb.org/


### Build
    
    docker build -t mcarr/mysql . 

### Configure

Change username,password, database in add_mysql_user.sh file

### Run

    docker run -d -i -t mcarr/mysql:latest

### Example connection:

    mysql -P 49162 -h 127.0.0.1 -u docker -p

    ssh root@localhost -p 49161

