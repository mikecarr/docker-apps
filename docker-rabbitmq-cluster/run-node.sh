PORT=3674
ERLANG_PORT=4370
MODE=-d
MASTER_NODE=dockersbx01
COOKIE=df232IYgV2noYi79Ag


docker run -p :$PORT -p :$ERLANG_PORT $MODE -h $HOSTNAME -t  mcarr/rabbitmq-cluster -u mcarr -p mcarr -v mcarr -c $COOKIE -P $PORT -m $MASTER_NODE -e $ERLANG_PORT -c $COOKIE
