#!/usr/bin/env bash

BAD_ARGS=65

# Check for correct number of arguments
if [ "$#" -ne 3 ]; then
  echo "Usage: $0 MIN MAX COUNT"
  exit $BAD_ARGS
fi

MIN=$1
MAX=$2
COUNT=$3

# Validate input
if ! [[ "$MIN" =~ ^-?[0-9]+$ && "$MAX" =~ ^-?[0-9]+$ && "$COUNT" =~ ^[1-9][0-9]*$ && "$MIN" -le "$MAX" ]]; then
  echo "Please provide valid integer range: MIN <= MAX and COUNT > 0"
  exit $BAD_ARGS
fi

for ((i=1; i<=COUNT; i++)); do
  echo -n "$(( RANDOM % (MAX - MIN + 1) + MIN )) "
done

echo

exit 0
