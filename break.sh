#!/usr/bin/env bash

LIMIT=20
counter=1
excluded=(3 11 12)

while [[ "$counter" -le "$LIMIT" ]]
do
  for a in ${excluded[@]}
  do
    if [[ "$counter" -eq "$a" ]]
    then
      (( counter++ ))
      continue
    fi
  done
  echo "Number is $counter"
  (( counter++ ))
done

exit 0
