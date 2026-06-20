#!/bin/bash

packages=("nginx" "curl" "wget")

apt update

for pkg in "${packages[@]}"
do
    if dpkg -s "$pkg" >/dev/null 2>&1
    then
        echo "$pkg is already installed. Skipping."
    else
        echo "$pkg is not installed. Installing..."
        apt install -y "$pkg"
    fi
done

