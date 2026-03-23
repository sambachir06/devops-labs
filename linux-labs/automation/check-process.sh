#!/bin/bash

process=$1

if [ -z "$process" ]
then
  echo "Usage: ./check-process.sh <process_name>"
  exit 1
fi

if pgrep "$process" > /dev/null
then
  echo "$process is running"
else
  echo "$process is NOT running"
fi
