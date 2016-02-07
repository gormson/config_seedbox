#!/bin/bash

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
	
	mkdir /home/"$utilisateur"/termines/vrac/other
	chown -R "$utilisateur":"$utilisateur" /home/"$utilisateur"/termines/vrac/other

done < "${1}"
