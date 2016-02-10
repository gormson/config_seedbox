#!/bin/bash

include pushover.list

sed -i -e "s/def plex/def $PUSHOVER plex/g" /home/gormson/rtorrent_postprocess
