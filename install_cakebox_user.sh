#!/bin/bash
#########################################################################
#																		                                    #
# Script : install_cakebox_user.sh									                  	#
# Description : Permet de remplir la partir utilisateurs et droits de	  #
#		l'installation cakebox light 									                      #
# Input : $1 - fichier listant les utilisateurs	(1 par ligne)			      #
# Auteur : GorMsoN														                          #
#                                                                       #
#########################################################################

groupadd web

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
	if [ -n "$utilisateur" ] && [ -d /home/"$utilisateur" ]
	then
		usermod -aG web "$utilisateur"
		usermod -aG web www-data
		
		chown -R "$utilisateur":web /home/"$utilisateur"/termines/
		find /home/"$utilisateur"/termines/ -type f -exec chmod 664 {} \;
		find /home/"$utilisateur"/termines/ -type d -exec chmod 775 {} \;
	
		cp ./scripts/file_torrent.sh /home/"$utilisateur"/.session/file_torrent.sh
		chmod a+x /home/"$utilisateur"/.session/file_torrent.sh
	
done < "${1}"
