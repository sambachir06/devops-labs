#!/bin/bash

while true
do
  read -p "Enter your name (type 'exit' to quit): " name

  if [ "$name" = "exit" ]
  then
    echo "Goodbye!"
    break
  fi

  echo "Hello $name"
done
