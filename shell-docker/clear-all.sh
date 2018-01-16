#!/bin/bash
container=$(docker ps | awk '{print $1}' | sed '1d')
if [ -n "$container" ];then
     docker stop $container
     net=$(docker network ls | awk '{print $2}' | sed '1d' | grep -v 'bridge' | grep -v 'host' | grep -v 'none')
     if [ -n "$net" ];then
         docker network rm $net
     fi
     gg=$(docker ps -a | awk '{print $1}' | sed '1d')
     docker rm $gg
     images=$(docker images | awk '{print $3}' | sed '1d')
     docker rmi $images     
else 
     net=$(docker network ls | awk '{print $2}' | sed '1d' | grep -v 'bridge' | grep -v 'host' | grep -v 'none')
     if [ -n "$net" ];then
         docker network rm $net
     fi
     images=$(docker images | awk '{print $3}' | sed '1d')
     docker rmi $images
     gg=$(docker ps -a | awk '{print $1}' | sed '1d')
     docker rm $gg
fi

