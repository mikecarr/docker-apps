



## Build

     docker build -t mcarr/rabbitmq:1.0 .

     # connect
     docker run  -i -t mcarr/rabbitmq:1.0 /bin/bash


## RUN

     docker run -d mcarr/rabbitmq:1.0 -u mcarr -p password -v newvhost
