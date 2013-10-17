
## Docker MySQL

### Build
    
    docker build -t ssat/mysql . 

### Configure

Change username,password, database in add_mysql_user.sh file

### Run

    docker run -d -i -t mcarr/mysql:latest

### Example connection:

    mysql -P 49162 -h 127.0.0.1 -u docker -p

    ssh root@localhost -p 49161

