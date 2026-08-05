#!/bin/bash

git add .
git commit -m "refresh"

if ! git push origin main; then
    echo "pulling last commits from the main repository folder"
    
    if git pull --rebase origin main; then
        echo "you are now up to date"
        git push origin main
        
    else
        echo -e "There is a \e[31mConflict\e[0m"
        read -n 1 -s -r
        exit 1
        
    fi
fi
