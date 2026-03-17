#!/bin/bash

echo "DevOps System Information Script"
echo "--------------------------------"

echo ""
echo "Current User:"
whoami

echo ""
echo "Current Directory:"
pwd

echo ""
echo "System Uptime:"
uptime

echo ""
echo "Logged In Users:"
who

echo ""
echo "System Load:"
uptime | awk '{print $8 $9 $10}'

echo ""
echo "Disk Usage:"
df -h
