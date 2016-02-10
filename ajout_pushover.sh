#!/bin/bash

source pushover.list

sed -i -e "s/def plex/def $PUSHOVER plex/g" /home/gormson/rtorrent_postprocess
