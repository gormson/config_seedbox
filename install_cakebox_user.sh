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

#Création du script de mise à jour des droits pour cakebox
{
	printf "#!/bin/bash\n"
	printf "\n"
	printf "# mise à jour des chmod et du groupe.\n"
	printf "# chmod 775 pour les dossiers et chmod 664 pour les fichiers (obligatoire)\n"
	printf "find /home/$USER/termines ! -group web -type f -exec chmod 664 {} \;\n"
	printf "find /home/$USER/termines ! -group web -type d -exec chmod 775 {} \;\n"
	printf "find /home/$USER/termines ! -group web -exec chown $USER:web {} \;\n"

	exit 0
	} > /tmp/file_torrent.sh

groupadd web

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
	if [ -d /home/"$utilisateur" ]
	then
		usermod -aG web "$utilisateur"
		usermod -aG web www-data
		
		chown -R "$utilisateur":web /home/"$utilisateur"/termines/
		find /home/"$utilisateur"/termines/ -type f -exec chmod 664 {} \;
		find /home/"$utilisateur"/termines/ -type d -exec chmod 775 {} \;
	
		cp /tmp/file_torrent.sh /home/"$utilisateur"/.session/file_torrent.sh
		chmod a+x /home/"$utilisateur"/.session/file_torrent.sh
		
		service "$utilisateur"-rtorrent restart
	
done < "${1}"
