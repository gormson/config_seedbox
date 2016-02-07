#!/bin/bash

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
	rm -R /home/"$utilisateur"/termines/other
	mkdir /home/"$utilisateur"/termines/vrac/other
	chown -R "$utilisateur":"$utilisateur" /home/"$utilisateur"/termines/vrac/other

done < "${1}"
