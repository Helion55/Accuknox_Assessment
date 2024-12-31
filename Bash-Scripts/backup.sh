# ! /usr/bin/env bash

git status | grep Untracked
status=$(echo $?)

if [ $status -eq 0 ]
then
    echo "Found new files..! Backup started..."
    git add .
    git commit -m"new files added"
    git push origin main
    echo "Backup successful..."
else
    echo "Create new files to backup...."
fi