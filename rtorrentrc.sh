#!/bin/bash

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
	if [ -n "$utilisateur" ] && [ -d /home/"$utilisateur" ]
	then
		mkdir /home/"$utilisateur"/torrents/other
		mkdir /home/"$utilisateur"/termines/vrac/other
		chown -R "$utilisateur":"$utilisateur" /home/"$utilisateur"/torrents/other
		chown -R "$utilisateur":"$utilisateur" /home/"$utilisateur"/termines/vrac/other
	else
		echo "utilisateur : $utilisateur inexistant"
	fi

done < "${1}"
