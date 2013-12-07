#!/bin/sh

while getopts "u:p:v:c:m:P:e:h" ARG 
do
  case $ARG in
    u)
      USERNAME=$OPTARG
      echo $USERNAME
      ;;
    p)
      PASSWORD=$OPTARG
      echo $PASSWORD
      ;;
    v)
      VHOST="/$OPTARG"
      echo $VHOST
      ;;
    m)
      CLUSTER_MASTER=$OPTARG
      echo $CLUSTER_MASTER
      ;;
    P)
      PORT=$OPTARG
      echo $PORT
      ;;
    e)
      ERLANG_PORT=$OPTARG
      echo $ERLANG_PORT
      ;;
    c)
      COOKIE=$OPTARG
      echo $COOKIE
      ;;
    h)
      echo "Args:"
      echo "-u <username>"
      echo "-p <password>"
      echo "-v <vhost>"
      echo "-m <cluster master>"
      echo "-P <port>"
      echo "-e <erlang port>"
      echo "-c <cookie>"
      echo "-h help"
      exit
      ;;
  esac
done


#echo $COOKIE > ~/.erlang.cookie
echo $COOKIE > /var/lib/rabbitmq/.erlang.cookie

export RABBITMQ_SERVER_START_ARGS="-setcookie $COOKIE -kernel inet_dist_listen_min $PORT -kernel inet_dist_listen_max $PORT"
export ERL_EPMD_PORT=$ERLANG_PORT

rabbitmq-server -detached 

sleep 2
# ram nodes for greater than 2
rabbitmqctl stop_app
#rabbitmqctl reset

if [ ! -z "$CLUSTER_MASTER" ]; then
  echo "******** HERE $CLUSTER_MASTER . "
  rabbitmqctl join_cluster rabbit@$CLUSTER_MASTER

fi

rabbitmqctl start_app

sleep 2

rabbitmqctl add_vhost $VHOST
rabbitmqctl add_user $USERNAME $PASSWORD 
rabbitmqctl set_permissions -p $VHOST $USERNAME ".*" ".*" ".*"   
rabbitmqctl set_user_tags $USERNAME administrator 
rabbitmqctl delete_user guest


/usr/bin/supervisord -n


