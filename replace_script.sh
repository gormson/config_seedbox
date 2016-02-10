#!/bin/bash

#$1 Fichier utilisateurs
#$2 nom du script a remplacer se trouvant dans ./scripts

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
	if [ -n "$utilisateur" ] && [ -d /home/"$utilisateur" ]
	then
	  	if [ -f /home/"$utilisateur"/"$2" ]
	  	then
	  		mv /home/"$utilisateur"/"$2" ./backups/"$2"_"$utilisateur"_"$(date "+%Y%m%d_%H%M%S")"
	  		if [ -f ./scripts/"$2" ]
	  		then
	  			cp ./scripts/"$2" /home/"$utilisateur"/
	  			chmod a+x /home/"$utilisateur"/"$2"
	  			chown "$utilisateur":"$utilisateur" /home/"$utilisateur"/"$2"
	  		else
	  			printf "Aucun scripts %b dans ./scripts pour %b\ı" "$2" """$utilisateur"
	  		fi
	  	else
	  		printf "Le script /home/%b/%b n'existe pas\ı" "$utilisateur" "$2"
	  	fi
	else
		echo "utilisateur : $utilisateur inexistant"
	fi

done < "${1}"
