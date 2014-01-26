#!/bin/sh

USERNAME=rabbitmq
PASSWORD=rabbitmq
VHOST=/rabbitmq

while getopts "u:p:v:" ARG 
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
  esac
done
  
rabbitmq-server -detached

sleep 2

rabbitmqctl add_vhost $VHOST
rabbitmqctl add_user $USERNAME $PASSWORD 
rabbitmqctl set_permissions -p $VHOST $USERNAME ".*" ".*" ".*"   
rabbitmqctl set_user_tags $USERNAME administrator 
rabbitmqctl delete_user guest

/usr/bin/supervisord -n


