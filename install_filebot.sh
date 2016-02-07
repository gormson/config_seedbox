#!/bin/bash

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
  cp -R /tmp/filebot /home/"$utilisateur"/.filebot
  chown -R "$utilisateur":"$utilisateur" /home/"$utilisateur"/.filebot
  
  chmod a+x /home/"$utilisateur"/.filebot/filebot.sh
  chmod a+x /home/"$utilisateur"/.filebot/update-filebot.sh
done < "${1}"
