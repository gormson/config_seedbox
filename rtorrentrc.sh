#!/bin/bash

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do

	mv /home/"$utilisateur"/.rtorrent.rc /home/"$utilisateur"/.rtorrent.rc.bak
	mv /home/gormson/rtorrent_rc/.rtorrent_"$utilisateur".rc /home/"$utilisateur"/.rtorrent.rc 
	
	service "$utilisateur"-rtorrent restart
	

done < "${1}"
