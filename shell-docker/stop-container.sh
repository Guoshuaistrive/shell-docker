#!/bin/bash
container=$(docker ps | awk '{print $1}' | sed '1d')
if [ -n "$container" ];then
   docker stop $container
fi
 
