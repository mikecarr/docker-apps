
# Docker : RabbitMQ


## Build

     docker build -t mcarr/rabbitmq:1.0 .

     # connect
     docker run  -i -t mcarr/rabbitmq:1.0 /bin/bash

## RUN

     # arguments
     # u - username (default: rabbitmq)
     # p - password (default: rabbitmq)
     # v - vhost (default: rabbitmq)

     docker run -d mcarr/rabbitmq:1.0 -u mcarr -p password -v newvhost
