#!/bin/bash

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
	if [ ! -n "$utilisateur" ] & [ -d /home/"$utilisateur" ]
	then
	  cp /home/"
		cp ./scripts/rtorrent_postprocessdelete /home/"$utilisateur"
		chown "$utilisateur":"$utilisateur" /home/"$utilisateur"/rtorrent_postprocessdelete
		chmod a+x /home/"$utilisateur"/rtorrent_postprocessdelete
	else
		echo "utilisateur : $utilisateur inexistant"
	fi

done < "${1}"
