
## Docker MariaDB

MariaDB - An enhanced, drop-in replacement for MySQL.
https://mariadb.org/


### Build
    
    docker build -t mcarr/mariadb. 

### Configure

Change username,password, database in setup_start.sh file

### Run

    docker run -d -i -t mcarr/mariadb:latest

### Example connection:

    mysql -P 49162 -h 127.0.0.1 -u docker -p

    ssh root@localhost -p 49161

