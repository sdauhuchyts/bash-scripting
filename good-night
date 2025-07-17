#!/usr/bin/env bash

set -e

E_BAD_ARGS=65

sleep_in_seconds=$1

if [[ "$#" -ne 1 ]]; then
  echo "Bad arguments passed"
  echo "Usage: $(basename "$0") sleep_in_seconds"
  exit $E_BAD_ARGS
fi

if ! [[ "$sleep_in_seconds" =~ ^([1-9][0-9]*|0)$ ]]; then
  echo "Error: sleep_in_seconds must be a positive integer."
  exit $E_BAD_ARGS
fi

clear
echo "Sleeping in $sleep_in_seconds seconds"
echo "Press Ctrl+C to cancel the sleep"

while [[ "$sleep_in_seconds" -ne 0 ]]; do
  sleep 1
  sleep_in_seconds=$(( sleep_in_seconds - 1 ))
  hours_remaining=$(( sleep_in_seconds / 3600 ))
  minutes_remaining=$(( sleep_in_seconds / 60 - hours_remaining * 60 ))
  seconds_remaining=$(( sleep_in_seconds - hours_remaining * 3600 - minutes_remaining * 60 ))
  echo -ne "\rSuspending in $hours_remaining hours $minutes_remaining minutes $seconds_remaining seconds"
done

echo -e "\nSuspending the system"
sleep 5
systemctl suspend -i
