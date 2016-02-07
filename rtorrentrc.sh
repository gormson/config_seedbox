#!/bin/bash

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do

	mkdir /home/"$utilisateur"/torrents/other
	chown -R "$utilisateur":"$utilisateur" /home/"$utilisateur"/torrents/other
	
	mkdir /home/"$utilisateur"/termines/other
	chown -R "$utilisateur":"$utilisateur" /home/"$utilisateur"/termines/other

done < "${1}"
