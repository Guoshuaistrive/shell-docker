#!/bin/bash
container=$(docker ps | awk '{print $1}' | sed '1d')
docker stop $container
 
