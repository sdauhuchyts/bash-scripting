#!/usr/bin/env bash

E_BAD_ARGS=65

if [[ "$#" -ne 2 || "$2" -lt 1 ]]
then
  echo "Script creates copies of original file"
  echo "Usage: $(basename $0) original_file copy_num"
  exit $E_BAD_ARGS
fi

original_file=$1
copy_num=$2

i=1
file_name=${original_file%.*}
echo "file name: $file_name"
file_ext=${original_file#*.}
echo "file extention: $file_ext"

while [[ "$i" -le "$copy_num" ]]
do
  cp $original_file $file_name-$i.$file_ext
  (( i++ ))
done

exit 0
