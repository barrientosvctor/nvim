#!/bin/bash

update="$1" || "0"

if [[ $update -eq "1" ]];
then
    git submodule init
    git submodule update
elif [[ $update -eq "2" ]];
then
    git submodule update --remote
elif [[ $update -eq "3" ]];
then
    git submodule deinit --all
else
    echo "Wrong option."
    echo "1. Install modules"
    echo "2. Update modules"
    echo "3. Uninstall modules"
fi
