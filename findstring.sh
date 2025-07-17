#!/bin/bash
# findstring.sh:
# Find a particular string in the binaries in a specified directory.

E_NO_ARGS=65

if [[ $# -ne 2 ]]
then
  echo "Usage: $(basename $0) dir_name string_name"
  exit $E_NO_ARGS
fi
  
directory=$1
fstring=$2

for file in $( find $directory -type f -name '*' | sort )
do
  strings -f $file | grep "$fstring" | sed -e "s%$directory%%"
  #  In the "sed" expression,
  #+ it is necessary to substitute for the normal "/" delimiter
  #+ because "/" happens to be one of the characters filtered out.
  #  Failure to do so gives an error message. (Try it.)
done  

exit $?

#  Exercise (easy):
#  ---------------
#  Convert this script to take command-line parameters
#+ for $directory and $fstring.
