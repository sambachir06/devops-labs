#!/bin/bash

echo "Log Monitoring Script"
echo "---------------------"

LOG_FILE="../app.log"

echo "Total ERROR logs:"
grep -c ERROR $LOG_FILE

echo ""

echo "Total WARNING logs:"
grep -c WARNING $LOG_FILE

echo ""

echo "Recent ERROR logs:"
grep ERROR $LOG_FILE | tail -5
