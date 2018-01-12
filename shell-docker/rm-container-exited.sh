#!/bin/bash
container=$(docker ps -a | awk '{print $1}' | sed '1d')
docker rm $container
