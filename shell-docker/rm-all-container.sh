#!/bin/bash
container=$(docker ps | awk '{print $1}' | sed '1d')
docker stop $container
gg=$(docker ps -a | awk '{print $1}' | sed '1d')
docker rm $gg

