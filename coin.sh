#!/usr/bin/env bash

a=()
len=13
div=10

echo "Give odd or even numbers in a row"
echo "Length = $len"
echo "Number < $div"

for (( i=0; i<$len; i++ )); do 
    c=$(($RANDOM % $div))
    a+=($c)
    if [[ $(( $c % 2 )) -eq 1 ]]; then
        if [[ "$i" -eq 0 ]]; then
            d="odd"
            d_old=$d
        else    
            d_old=$d
            d="odd"
        fi
    else
        if [[ "$i" -eq 0 ]]; then
            d="even"
            d_old=$d
        else
            d_old=$d
            d="even"
        fi
    fi
    if [[ "$d" != "$d_old" ]]; then
        i=-1
        a=()
    fi
done

echo "${a[@]}"

exit 0
