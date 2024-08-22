#!/bin/bash

start_time=$(date +%s)
start_battery=$(cat /sys/class/power_supply/BAT0/capacity)

echo "Starting battery level: $start_battery%"

while true; do
  current_time=$(date +%s)
  elapsed=$((current_time - start_time))
  current_battery=$(cat /sys/class/power_supply/BAT0/capacity)
  
  hours=$((elapsed / 3600))
  minutes=$(( (elapsed % 3600) / 60 ))
  seconds=$((elapsed % 60))
  
  clear
  echo "Elapsed time: $hours:$minutes:$seconds"
  echo "Starting battery level: $start_battery%"
  echo "Current battery level: $current_battery%"
  echo "Battery used: $((start_battery - current_battery))%"
  
  sleep 60  # Update every minute
done
