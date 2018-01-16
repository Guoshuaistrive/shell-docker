#!/bin/bash
container=$(docker ps | awk '{print $1}' | sed '1d')
if [ -n "$container" ];then
     docker stop $container
     images=$(docker images | awk '{print $3}')
     docker rmi $images    
else
     images=$(docker images | awk '{print $3}')
     docker rmi $images
fi



