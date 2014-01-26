#!/bin/bash

cd /tmp

su postgres -c "/usr/lib/postgresql/9.3/bin/postgres -D /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf" &

su postgres -c "psql -c \"create user docker with CREATEROLE superuser PASSWORD 'password';\""

su postgres -c "createdb -O docker docker"

supervisord -n

