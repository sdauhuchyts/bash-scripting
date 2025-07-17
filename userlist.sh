#!/usr/bin/env bash
# userlist.sh

PASSWORD_FILE=/etc/passwd
n=1           # User number

for name in $(awk '{FS=":"}{print $1}' < "$PASSWORD_FILE" )
# Field separator : ^^^^^^
# Print first field              ^^^^^^^^
# Get input from password file  /etc/passwd  ^^^^^^^^^^^^^^^^^
do
  echo "USER #$n = $name"
  let "n += 1"
done  


# USER #1 = root
# USER #2 = bin
# USER #3 = daemon
# ...
# USER #33 = bozo

exit $?
