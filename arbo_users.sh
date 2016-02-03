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

	cp rtorrent_postprocess "$BASEPATH"
	cp rtorrent-postprocessdelete "$BASEPATH"
	cp hardlink_delete "$BASEPATH"

	cp /home/rootgorm/rtorrent_postprocess "$BASEPATH"/rtorrent_postprocess
	cp /home/rootgorm/rtorrent_sniffer "$BASEPATH"/rtorrent_sniffer

done < "${1}"
