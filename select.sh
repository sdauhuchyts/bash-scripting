#!/bin/bash

PS3='Choose your favorite vegetable: ' # Sets the prompt string.
                                       # Otherwise it defaults to #? .

echo

print_vegetable () {
  echo "Your favourite vegetable is $vegetable"
}

select vegetable in "beans" "carrots" "potatoes" "onions" "rutabagas"
do
  echo "Your favorite veggie is $vegetable."
#  case "$vegetable" in
#  "beans" )
#  print_vegetable
#  ;;
#  "carrots" )
#  print_vegetable
#  ;;
#  "potatoes" )
#  print_vegetable
#  ;;
#  "onions" )
#  print_vegetable
#  ;;
#  "rutabagas" )
#  print_vegetable
#  ;;
#  * )
#  echo "Sorry"
#  ;;
#  esac
  break  # What happens if there is no 'break' here?
done

exit

# Exercise:
# --------
#  Fix this script to accept user input not specified in
#+ the "select" statement.
#  For example, if the user inputs "peas,"
#+ the script would respond "Sorry. That is not on the menu."
