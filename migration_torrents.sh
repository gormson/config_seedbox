#!/bin/bash

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
  screen rsync -Haurovlgpz --progress -e "ssh -p $PORTCIBLE" /home/"$utilisateur"/torrents gormson@"$IPCIBLE":/home/gormson
  
done < "${1}"
