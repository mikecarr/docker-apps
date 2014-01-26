#!/bin/sh

cd /opt/activemq/apache-activemq-5.8.0
bin/activemq start


/usr/bin/supervisord -n


