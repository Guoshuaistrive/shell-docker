#!/bin/bash
images=$(docker images | awk '{print $3}')
docker rmi $images
