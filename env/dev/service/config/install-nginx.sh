#!/bin/bash 

sudo -s 
yum -y install nginx 
RESULT=`hostname`
echo ${RESULT} > /usr/share/nginx/html/index.html
systemctl restart nginx 