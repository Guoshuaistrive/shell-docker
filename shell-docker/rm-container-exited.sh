#!/bin/bash
gg=$(docker ps -a | awk '{print $1}' | sed '1d')
    if [ -n "$gg" ];then
         docker rm $gg
    fi

