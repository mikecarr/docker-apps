



## Build

     docker build -t ssat/rabbitmq:1.0 .

     # connect
     docker run  -i -t ssat/rabbitmq:1.0 /bin/bash


## RUN

     docker run -d ssat/rabbitmq:1.0 -u mcarr -p password -v newvhost
