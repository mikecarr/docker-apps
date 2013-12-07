PORT=3674
MODE=-d
ERLANG_PORT=4370
COOKIE=df232IYgV2noYi79Ag

#START_ARGS="RABBITMQ_SERVER_START_ARGS=-setcookie $COOKIE -kernel inet_dist_listen_min $PORT -kernel inet_dist_listen_max $PORT"
#EPMD_PORT="ERL_EPMD_PORT=$ERLANG_PORT"


docker run -p :$PORT -p :$ERLANG_PORT $MODE -h $HOSTNAME -t  mcarr/rabbitmq-cluster -u mcarr -p mcarr -v mcarr -c $COOKIE -P $PORT -e $ERLANG_PORT
