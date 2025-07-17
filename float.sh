#!/usr/bin/env bash

case "$1" in
  [0-9]*\.[0-9]* | [0-9]*\. )
  echo "Number is float"
  ;;

  * )
  echo "Something else"
  ;;
esac

exit 0
