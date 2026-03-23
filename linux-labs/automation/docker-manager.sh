#!/bin/bash

action=$1

if [ -z "$action" ]
then
  echo "Usage: ./docker-manager.sh {start|stop|status}"
  exit 1
fi

if [ "$action" = "start" ]
then
  docker start $(docker ps -aq)
  echo "All containers started"

elif [ "$action" = "stop" ]
then
  docker stop $(docker ps -q)
  echo "All running containers stopped"

elif [ "$action" = "status" ]
then
  docker ps

else
  echo "Invalid option. Use start, stop, or status."
fi
