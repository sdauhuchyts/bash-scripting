#!/usr/bin/env bash

E_NO_ARGS=65

if [[ "$#" -ne 1 ]]
then
  echo "Script usage: $(basename $0) URL"
  exit $E_NO_ARGS
fi

FULL_URL="${1}"
URL="${FULL_URL##http*\/}"

echo "${URL}"

exit 0
