#!/bin/bash
container=$(docker ps | awk '{print $1}' | sed '1d')
docker stop $container
net=$(docker network ls | awk '{print $1}' | sed '1d')
docker network rm $net


