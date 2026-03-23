#!/bin/bash

action=$1

if [ -z "$action" ]
then
  echo "Usage: ./docker-manager.sh {start|stop|status}"
  exit 1
fi

case "$action" in
  start)
    containers=$(docker ps -aq)

    if [ -z "$containers" ]
    then
      echo "No containers to start"
    else
      docker start $containers
      echo "All containers started"
    fi
    ;;

  stop)
    containers=$(docker ps -q)

    if [ -z "$containers" ]
    then
      echo "No running containers to stop"
    else
      docker stop $containers
      echo "All running containers stopped"
    fi
    ;;

  status)
    docker ps
    ;;

  *)
    echo "Invalid option. Use start, stop, or status."
    ;;
esac
