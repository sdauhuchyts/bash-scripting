#!/usr/bin/env bash

goods="chocolate banana egg"

if [[ $goods == *"chocolate"* ]]; then
    if [[ $goods == *"banana"* ]]; then
        echo "Take 4 chocolates 🍫🍫🍫🍫"
    else
        echo "Take 1 chocolate 🍫"
    fi
else
    echo "Take nothing"
fi

exit 0
