#!/bin/bash

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
	BASEPATH=/home/"$utilisateur"
	if [ -d $BASEPATH ]
		mkdir "$BASEPATH"/torrents/movie_hd
		mkdir "$BASEPATH"/torrents/movie_vrac
		mkdir "$BASEPATH"/torrents/movie_kids
		mkdir "$BASEPATH"/torrents/tv_vf
		mkdir "$BASEPATH"/torrents/tv_vo

		mkdir "$BASEPATH"/termines/
		mkdir "$BASEPATH"/termines/movie_hd
		mkdir "$BASEPATH"/termines/movie_vrac
		mkdir "$BASEPATH"/termines/movie_kids
		mkdir "$BASEPATH"/termines/tv_vf
		mkdir "$BASEPATH"/termines/tv_vo
		mkdir "$BASEPATH"/termines/Unsorted
		mkdir "$BASEPATH"/termines/vrac

		chown -R "$utilisateur":"$utilisateur" "$BASEPATH"/termines/
	
		if [ -f ./scripts/rtorrent_postprocess ]
		then
			cp ./scripts/rtorrent_postprocess "$BASEPATH"
			chmod a+x "$BASEPATH"/rtorrent_postprocess
		else
			echo "Erreur rtorrent-postprocess"
		fi
		
		if [ -f ./scripts/rtorrent-postprocessdelete ]
		then
			cp ./scripts/rtorrent-postprocessdelete "$BASEPATH"
			chmod a+x "$BASEPATH"/rtorrent-postprocessdelete
		else
			echo "Erreur rtorrent-postprocessdelete"
		fi
		
		if [ -f ./scripts/hardlink_delete ]
		then
			cp ./scripts/hardlink_delete "$BASEPATH"
			chmod a+x "$BASEPATH"/hardlink_delete
		else
			echo "hardlink_delete"
		fi
		
		chown -R "$utilisateur":"$utilisateur" "$BASEPATH"
	
	else
		echo "Erreur Création Arbo Dossiers, Skip user"
	fi

done < "${1}"
