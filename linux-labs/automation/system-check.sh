#!/bin/bash

echo "===== SYSTEM CHECK ====="

# Check Docker
if pgrep docker > /dev/null
then
  echo "Docker is running"
else
  echo "Docker is NOT running"
fi

# Check running containers
containers=$(docker ps -q)

if [ -z "$containers" ]
then
  echo "No containers are running"
else
  count=$(docker ps -q | wc -l)
  echo "$count containers are running"
fi
echo ""

read -p "Do you want to check logs? (yes/no): " answer

if [ "$answer" = "yes" ]
then
  read -p "Enter log file path: " logfile

  if [ -f "$logfile" ]
  then
    error_count=$(grep -c "ERROR" "$logfile")
    warning_count=$(grep -c "WARNING" "$logfile")

    echo "ERROR logs: $error_count"
    echo "WARNING logs: $warning_count"
  else
    echo "Log file not found"
  fi
fi
