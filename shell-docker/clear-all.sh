#!/bin/bash
container=$(docker ps | awk '{print $1}' | sed '1d')
if [ -n "$container" ];then
     docker stop $container
     net=$(docker network ls | awk '{print $2}' | sed '1d' | grep -v 'bridge' | grep -v 'host' | grep -v 'none')
     if [ -n "$net" ];then
         docker network rm $net
     fi
     gg=$(docker ps -a | awk '{print $1}' | sed '1d')
     if [ -n "$gg" ];then
         docker rm $gg
     fi
     images=$(docker images | awk '{print $3}' | sed '1d')
     if [ -n "$images" ];then
         docker rmi $images
     fi

else 
     net=$(docker network ls | awk '{print $2}' | sed '1d' | grep -v 'bridge' | grep -v 'host' | grep -v 'none')
     if [ -n "$net" ];then
         docker network rm $net
     fi
     gg=$(docker ps -a | awk '{print $1}' | sed '1d')
     if [ -n "$gg" ];then
         docker rm $gg
     fi
     images=$(docker images | awk '{print $3}' | sed '1d')
     if [ -n "$images" ];then
         docker rmi $images
     fi
fi

