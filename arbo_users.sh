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
		mkdir "$BASEPATH"/torrents/other

		mkdir "$BASEPATH"/termines/
		mkdir "$BASEPATH"/termines/movie_hd
		mkdir "$BASEPATH"/termines/movie_vrac
		mkdir "$BASEPATH"/termines/movie_kids
		mkdir "$BASEPATH"/termines/tv_vf
		mkdir "$BASEPATH"/termines/tv_vo
		mkdir "$BASEPATH"/termines/Unsorted
		mkdir "$BASEPATH"/termines/vrac
		
		if [ -d /tmp/filebot ]
		then
			cp -R /tmp/filebot "$BASEPATH"/.filebot
			chmod a+x "$BASEPATH"/.filebot/filebot.sh
			chmod a+x "$BASEPATH"/.filebot/update-filebot.sh
		else
			echo "Erreur Copie Filebot"
		fi
		
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
		
		if [ -f "$BASEPATH"/.rtorrent.rc ]
		then
			cp "$BASEPATH"/.rtorrent.rc "$BASEPATH"/.rtorrent.bak
			echo "system.method.set_key=event.download.finished,update_file,\"execute=/home/$utilisateur/.session/file_torrent.sh\"" >> "$BASEPATH"/.rtorrent.rc
			echo "system.method.set_key=event.download.finished,filebot_amc,\"execute={/home/$utilisateur/rtorrent-postprocess,\$d.get_base_path=,\$d.get_name=,\$d.get_custom1=}\"" >> "$BASEPATH"/.rtorrent.rc
			echo "system.method.set_key=event.download.erased,rtorrent_hardlink_delete,\"execute={/home/$utilisateur/hardlink_delete,\$d.get_base_path=}\"" >> "$BASEPATH"/.rtorrent.rc
			echo "system.method.set_key=event.download.erased,filebot_cleaner,\"execute=/home/$utilisateur/rtorrent-postprocessdelete\"" >> "$BASEPATH"/.rtorrent.rc
		else
			echo "Erreur de modification .rtorrent."
		fi
	else
		echo "Erreur Création Arbo Dossiers, Skip user"
	fi

done < "${1}"
