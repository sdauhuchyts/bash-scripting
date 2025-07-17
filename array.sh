#!/usr/bin/env bash

arr=(one two three)

for item in "${arr[@]}"; do
  echo $item
done

exit 0
