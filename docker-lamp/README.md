## Docker LAMP

 * Apache2
 * MySQL
 * PHP
 * PhpMyAdmin
 * SSH
 
### Build

    docker build -t mcarr/lamp .

### Configure

Change username,password, database in add_mysql_user.sh file

### Run

    docker run -d -i -t mcarr/lamp:latest
    docker run -d -i -v www:/var/www/ -t mcarr/lamp:latest

### Example connection:

    docker ps
    ID                  IMAGE               COMMAND                CREATED             STATUS              PORTS
    3c2ef9c70f6d        mcarr/lamp:latest   /bin/bash /app/add_m   About an hour ago   Up About an hour    49161->22, 49162
    ->3306

    mysql -P 49162 -h 127.0.0.1 -u docker -p

    ssh root@localhost -p 49161

    http://localhost:49398/phpmyadmin
