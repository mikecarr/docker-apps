# Docker Apache Tomcat Server

Tomcat Manager

u/p: admin/tomcat

## BUILD:
docker build -t tomcat .

## RUN:

docker run -d -p 8080 -p 22 -t tomcat:latest

## TODO:

use a volume for web pages, does it work?
