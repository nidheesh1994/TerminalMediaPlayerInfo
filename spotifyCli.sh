#!/bin/bash
# A bash script to show media information



function showcurser {
	tput cvvis
	return 1
}
trap showcurser EXIT

function showmediainfo {
	set -o errexit	
	tput civis
	trap showcurser EXIT SIGINT SIGQUIT SIGKILL SIGTERM
	PLAYER_STATUS=$(playerctl status)
	ID=$(playerctl metadata mpris:trackid)
	if [ $PLAYER_STATUS = "Playing" ]; then
		clear
		PLAYER_NAME=$(playerctl -l)
		PLAYER_METADATA=$(playerctl metadata)
		TRACK_ID=$(playerctl metadata mpris:trackid)
		LENGTH=$(playerctl metadata mpris:length)
		ART_URL=$(playerctl metadata mpris:artUrl)
		ALBUM=$(playerctl metadata xesam:album)
		ARTIST=$(playerctl metadata xesam:artist)
		RATING=$(playerctl metadata xesam:autoRating)
		TITLE=$(playerctl metadata xesam:title)
		URL=$(playerctl metadata xesam:url)
		echo "Title   : $TITLE"
		echo "Album   : $ALBUM"
		echo "Artist  : $ARTIST"
		echo "Rating  : $RATING"
		echo "Url     : $URL"
		sleep 1
	else
		echo "Not playing anyting"
	fi
	
	selection=
	until [ "$selection" = "0" ];
	do
		STATUS=$(playerctl status)
		if [ $STATUS = "Playing" ]; then
			NEW_ID=$(playerctl metadata mpris:trackid)
			if [ $ID != $NEW_ID ] || [ $PLAYER_STATUS = "Paused" ]; then
				PLAYER_STATUS='Playing'
				ID=$NEW_ID
				clear
				PLAYER_NAME=$(playerctl -l)
				PLAYER_METADATA=$(playerctl metadata)
				TRACK_ID=$(playerctl metadata mpris:trackid)
				LENGTH=$(playerctl metadata mpris:length)
				ART_URL=$(playerctl metadata mpris:artUrl)
				ALBUM=$(playerctl metadata xesam:album)
				ARTIST=$(playerctl metadata xesam:artist)
				RATING=$(playerctl metadata xesam:autoRating)
				TITLE=$(playerctl metadata xesam:title)
				URL=$(playerctl metadata xesam:url)
				echo "Title   : $TITLE"
				echo "Album   : $ALBUM"
				echo "Artist  : $ARTIST"
				echo "Rating  : $RATING"
				echo "Url     : $URL"
			else
				PLAYER_STATUS='Playing'
			fi
		else
			PLAYER_STATUS='Paused'
			clear
			echo "Not playing anything"
		fi
		sleep 1

	done
}
showmediainfo
return
EOF
