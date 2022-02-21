#!/bin/bash

port=$1

echo "*****Socket*****" 
ss -antl | grep -e "$port"

echo "*****Process*****"
ps -aux | grep -e "$port"

echo "*****Docker*****"
/usr/bin/docker ps -a | grep -e "$port"

echo "*****NC*****"
nc -l $port
