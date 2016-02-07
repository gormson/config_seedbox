#!/bin/bash

while IFS="" read -r utilisateur || [[ -n "$utilisateur" ]]
do
	BASEPATH=/home/"$utilisateur"
	mkdir "$BASEPATH"/torrents/movie_hd
	mkdir "$BASEPATH"/torrents/movie_vrac
	mkdir "$BASEPATH"/torrents/movie_kids
	mkdir "$BASEPATH"/torrents/tv_vf
	mkdir "$BASEPATH"/torrents/tv_vo

	chown -R "$utilisateur":"$utilisateur" "$BASEPATH"/torrents/

	mkdir "$BASEPATH"/termines/
	mkdir "$BASEPATH"/termines/movie_hd
	mkdir "$BASEPATH"/termines/movie_vrac
	mkdir "$BASEPATH"/termines/movie_kids
	mkdir "$BASEPATH"/termines/tv_vf
	mkdir "$BASEPATH"/termines/tv_vo
	mkdir "$BASEPATH"/termines/Unsorted
	mkdir "$BASEPATH"/termines/vrac

	chown -R "$utilisateur":"$utilisateur" "$BASEPATH"/termines/
	
	cp ./scripts/rtorrent_postprocess "$BASEPATH"
	chown -R "$utilisateur":"$utilisateur" "$BASEPATH"/rtorrent_postprocess
	chmod +x "$BASEPATH"/rtorrent_postprocess
	
	cp ./scripts/rtorrent-postprocessdelete "$BASEPATH"
	chown -R "$utilisateur":"$utilisateur" "$BASEPATH"/rtorrent-postprocessdelete
	chmod +x "$BASEPATH"/rtorrent-postprocessdelete
	
	cp ./scripts/hardlink_delete "$BASEPATH"
	chown -R "$utilisateur":"$utilisateur" "$BASEPATH"/hardlink_delete
	chmod +x "$BASEPATH"/hardlink_delete
	
	cp ./scripts/rtorrent_sniffer "$BASEPATH"/rtorrent_sniffer
	chown -R "$utilisateur":"$utilisateur" "$BASEPATH"/rtorrent_sniffer
	chmod +x "$BASEPATH"/rtorrent_sniffer

done < "${1}"
