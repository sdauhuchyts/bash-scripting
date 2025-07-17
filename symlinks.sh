#!/usr/bin/env bash

outfile=symlinks.list
directory=${1:-$PWD}

echo "The list of symlinks" > $outfile
echo "--------------------" >> $outfile

for file in $( find $directory -type l -name "*" )
do
  echo $file
done | sort >> $outfile

exit 0
