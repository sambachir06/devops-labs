#!/bin/bash

read -p "Enter log file name: " logfile

if [ ! -f "$logfile" ]
then
  echo "File does not exist!"
  exit 1
fi

echo "Analyzing logs..."

error_count=$(grep -c "ERROR" "$logfile")
warning_count=$(grep -c "WARNING" "$logfile")

echo "Total ERROR logs: $error_count"
echo "Total WARNING logs: $warning_count"
