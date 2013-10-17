## Docker MySQL

### Build
    
    docker build -t ssat/mysql . 

### Configure

Change username,password, database in add_mysql_user.sh file

### Run

    docker run -d -i -t mcarr/mysql:latest

### Example connection:

    docker ps
    ID                  IMAGE               COMMAND                CREATED             STATUS              PORTS
    3c2ef9c70f6d        ssat/mysql:latest   /bin/bash /app/add_m   About an hour ago   Up About an hour    49161->22, 49162
    ->3306

    mysql -P 49162 -h 127.0.0.1 -u docker -p

    ssh root@localhost -p 49161

