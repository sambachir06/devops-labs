#!/bin/bash

read -p "Enter your name: " name

if [ "$name" = "Sammy" ]
then
  echo "Welcome, admin!"
else
  echo "Access denied"
fi
