#!/bin/bash

read -p "enter file name you want to search: " FILE

if [ -f "$FILE" ]; then
        echo "file present"
else
        echo "file not present"
fi

