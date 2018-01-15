docker network rm $1
if [ $? -ne 0 ]; then
      container=$(docker ps | awk '{print $1}' | sed '1d')
      docker stop $container
      docker network rm $1
fi
