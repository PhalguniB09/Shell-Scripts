#!/bin/bash
read -p "enter any number: " NUM

if [[ $NUM -gt 0 ]]; then
        echo "positive number"
elif [[ $NUM -lt 0 ]]; then
        echo "Negative number"
else
        echo "its zero"
fi

