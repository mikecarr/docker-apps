


## Build

     docker build -t mcarr/rabbitmq:1.0 .

     # connect
     docker run  -i -t mcarr/rabbitmq:1.0 /bin/bash


## RUN


### Server
   
   edit run-server.sh, set PORT, ERLANG_PORT and COOKIE
  
    ./docker-master.sh
   
### Additional Nodes
   
   edit run-node.sh, set PORT, ERLANG_PORT and COOKIE to same as server, set MASTER_NODE to server short name.
   
    ./docker-node.sh

