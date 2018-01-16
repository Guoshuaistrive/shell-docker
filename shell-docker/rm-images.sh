#!/bin/bash
container=$(docker ps | awk '{print $1}' | sed '1d')
if [ -n "$container" ];then
     docker stop $container
     images=$(docker images | awk '{print $3}' | sed '1d')
     docker rmi $images    
else
     images=$(docker images | awk '{print $3}' | sed '1d')
     if [ -n "$images" ];then
         docker rmi $images
     fi

fi



