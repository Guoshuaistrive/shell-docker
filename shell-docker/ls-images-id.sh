#!/bin/bash
docker images | awk '{print $3}' | sed '1d'
